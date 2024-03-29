class AssetTagsController < ApplicationController
  before_action :set_asset_tag, only: [:show, :edit, :update, :destroy]

  #cancancan
  load_and_authorize_resource
  # GET /asset_tags
  # GET /asset_tags.json
  def index
    @asset_tags = AssetTag.all
    AssetTag.reindex

  end

  # GET /asset_tags/1
  # GET /asset_tags/1.json
  def show
    @line_item = LineItem.new
    AssetTag.reindex
    @order_select = Order.where.not(finalized: true)
  end

  # GET /asset_tags/new
  def new
    @asset_tag = AssetTag.new
    #AssetLabelWorker.perform_async(@asset_tag.id)
  end

  # GET /asset_tags/1/edit
  def edit
  end

  # POST /asset_tags
  # POST /asset_tags.json
  def create

    respond_to do |format|
      @asset_tag = AssetTag.new(asset_tag_params)
      puts @asset_tag.inspect

      if @asset_tag.save(validate: false)
        format.html { redirect_to @asset_tag, notice: 'Asset tag was successfully created.' }
        format.json { render :show, status: :created, location: @asset_tag }
        AssetTag.reindex
      else
        format.html { render :new }
        format.json { render json: @asset_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_tags/1
  # PATCH/PUT /asset_tags/1.json
  def update
    respond_to do |format|
      if @asset_tag.update(asset_tag_params)
        format.html { redirect_to @asset_tag, notice: 'Asset tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @asset_tag }
      else
        format.html { render :edit }
        format.json { render json: @asset_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_tags/1
  # DELETE /asset_tags/1.json
  def destroy
    @asset_tag.destroy
    respond_to do |format|
      format.html { redirect_to asset_tags_url, notice: 'Asset tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def print_tag
    AssetLabelWorker.perform_async(params[:id])
    redirect_back fallback_location: '/', notice: "Asset tag sent to print server"
  end

  def print_tag_small
    AssetLabelSmallWorker.perform_async(params[:id])
    redirect_back fallback_location: '/', notice: "Asset tag sent to print server"
  end

  def print_tag_large
    AssetLabelLargeWorker.perform_async(params[:id])
    redirect_back fallback_location: '/', notice: "Asset tag sent to print server"
  end

  def print_tag_med
      AssetLabelMediumWorker.perform_async(params[:id])
      redirect_back fallback_location: '/', notice: "Asset tag sent to print server"
    end

  def taglookup
    @asset_tag = AssetTag.find_by(tag: params[:tag])
    puts @asset_tag
    logger.debug "you are looking up the asset with the tag #{@asset_tag}"
    if @asset_tag.consumable_id.present?
      logger.info "this is a consumable"
      redirect_to "/consumables/#{@asset_tag.consumable_id}"
    else @asset_tag.fixed_asset_id.present?
      logger.info "this is a fixed asset"
      redirect_to "/fixed_assets/#{@asset_tag.fixed_asset_id}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_tag
      @asset_tag = AssetTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_tag_params
      params.require(:asset_tag).permit(:tag, :consumable_id, :location_id, :fixed_asset_id, line_item_attributes: [:order_id])
    end
end
