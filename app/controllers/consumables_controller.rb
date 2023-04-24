class ConsumablesController < ApplicationController
  before_action :set_consumable, only: [:show, :edit, :update, :destroy]

  #cancancan
  load_and_authorize_resource

  # GET /consumables
  # GET /consumables.json
  def index
    @consumables = Consumable.where.not(obsolete: "TRUE")
  end

  # GET /consumables/1
  # GET /consumables/1.json
  def show
    @location = Consumable.all
    @line_item = LineItem.new
    @order_select = Order.where.not(finalized: true)
    logger.info @order_select
    @user = User.all
  end

  # GET /consumables/new
  def new
    @consumable = Consumable.new
    @part = Part.all
  end

  # GET /consumables/1/edit
  def edit
  end

  # POST /consumables
  # POST /consumables.json
  def create
    @consumable = Consumable.new(consumable_params)
    @locations = Location.all

    respond_to do |format|
      if @consumable.save
        job_id = TagMakerWorker.perform_async("consumable", @consumable.id)

        until Sidekiq::Status::complete? job_id
          sleep(0.5)
          if Sidekiq::Status::failed? job_id
            logger.error "JOB FAILED!!!!!!!"
            redirect_back fallback_location: '/', alert: "We've run into a server boo. Please contact your admin if this problem continues."
            logger.debug "Rolling back transaction"
            raise ActiveRecord::Rollback
            break
          end
        end
          format.html { redirect_to @consumable, notice: 'Consumable was successfully created!' }
          format.json { render :show, status: :created, location: @consumable }

      else
        format.html { render :new }
        format.json { render json: @consumable.errors, status: :unprocessable_entity }
      end
    end
    Consumable.reindex
    end


  # PATCH/PUT /consumables/1
  # PATCH/PUT /consumables/1.json
  def update
    current_user
    respond_to do |format|
      if @consumable.update(consumable_params)
        format.html { redirect_to @consumable, notice: 'Consumable was successfully updated.' }
        format.json { render :show, status: :ok, location: @consumable }
      else
        format.html { render :edit }
        logger.error "There was an error updating the consumable"
        logger.error json: @consumable.errors
        format.json { render json: @consumable.errors, status: :unprocessable_entity }
      end
    end
    Consumable.reindex
  end

  # DELETE /consumables/1
  # DELETE /consumables/1.json
  def destroy
    @consumable.destroy
    respond_to do |format|
      format.html { redirect_to consumables_url, notice: 'Consumable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def print_tag_med
    @asset_tag = AssetTag.all
    tag = @asset_tag.find_by(consumable_id: params[:id])

    AssetLabelMediumWorker.perform_async(tag.id)
    redirect_back fallback_location: '/', notice: "Asset tag sent to print server"
  end

  def print_tag_large
    @asset_tag = AssetTag.all
    tag = @asset_tag.find_by(consumable_id: params[:id])

    AssetLabelLargeWorker.perform_async(tag.id)
    redirect_back fallback_location: '/', notice: "Asset tag sent to print server"
  end

  def item_tag_maker
    quantity = params[:item_quantity]
    consumable_id = params[:id]
    ItemTagGenWorker.perform_async(consumable_id, quantity)
    redirect_back fallback_location: '/', notice: "creating #{quantity} tags and printing!"
  end

  def remove_one
    consumable = Consumable.find(params[:id])
    quantity_update = consumable.quantity - 1
    consumable.quantity = quantity_update
    consumable.save
    redirect_back fallback_location: '/', notice: "Removed Quantity 1"

  end


  def obsolete
      @consumables = Consumable.where(obsolete: "TRUE")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumable
      @consumable = Consumable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consumable_params
      params.require(:consumable).permit(:tag, :name, :description, :quantity, :reorderAmount, :location, :shelf, :bin, :obsolete, :part_id, :category, :overstock, :overstock_quantity, :overstock_location, :overstock_notes, :site,
        asset_tag_attributes: [:location_id, :tag],
        location_attributes: [:name], part_attributes: [:internal_part],
        line_item_attributes: [:order_id, :quantity, :consumable_id])
    end
end
