class ConsumablesController < ApplicationController
  before_action :set_consumable, only: [:show, :edit, :update, :destroy]

  # GET /consumables
  # GET /consumables.json
  def index
    @consumables = Consumable.where.not(obsolete: "TRUE")
    Consumable.reindex
  end

  # GET /consumables/1
  # GET /consumables/1.json
  def show
    @location = Consumable.all
    @line_item = LineItem.new
    @order_select = Order.where.not(finalized: true)
    logger.info @order_select
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

    respond_to do |format|
      if @consumable.save
        TagMakerWorker.perform_async("consumable", @consumable.id)
        Consumable.reindex
        #this is a sad excuse for a loading spinner. we need to do this differently in production
        sleep 3
        format.html { redirect_to asset_tags_path, notice: 'Consumable was successfully created. Please creat asset tag for the consumable you just created' }
        format.json { render :show, status: :created, location: @consumable }
      else
        format.html { render :new }
        format.json { render json: @consumable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consumables/1
  # PATCH/PUT /consumables/1.json
  def update
    respond_to do |format|
      if @consumable.update(consumable_params)
        format.html { redirect_to @consumable, notice: 'Consumable was successfully updated.' }
        format.json { render :show, status: :ok, location: @consumable }
      else
        format.html { render :edit }
        format.json { render json: @consumable.errors, status: :unprocessable_entity }
      end
    end
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


  def obsolete
    #TODO Add lookup for obsolete parts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumable
      @consumable = Consumable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consumable_params
      params.require(:consumable).permit(:tag, :name, :description, :quantity, :reorderAmount, :location, :shelf, :bin, :obsolete, :part_id,
        asset_tag_attributes: [:location_id, :tag],
        location_attributes: [:name], part_attributes: [:internal_part],
        line_item_attributes: [:order_id, :quantity, :consumable_id])
    end
end
