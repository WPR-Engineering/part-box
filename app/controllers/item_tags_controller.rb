class ItemTagsController < ApplicationController
  before_action :set_item_tag, only: [:show, :edit, :update, :destroy]

  # GET /item_tags
  # GET /item_tags.json
  def index
    @item_tags = ItemTag.all
  end

  # GET /item_tags/1
  # GET /item_tags/1.json
  def show
  end

  # GET /item_tags/new
  def new
    @item_tag = ItemTag.new
  end

  # GET /item_tags/1/edit
  def edit
  end

  # POST /item_tags
  # POST /item_tags.json
  def create
    @item_tag = ItemTag.new(item_tag_params)

    respond_to do |format|
      if @item_tag.save
        format.html { redirect_to @item_tag, notice: 'Item tag was successfully created.' }
        format.json { render :show, status: :created, location: @item_tag }
      else
        format.html { render :new }
        format.json { render json: @item_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_tags/1
  # PATCH/PUT /item_tags/1.json
  def update
    respond_to do |format|
      if @item_tag.update(item_tag_params)
        format.html { redirect_to @item_tag, notice: 'Item tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_tag }
      else
        format.html { render :edit }
        format.json { render json: @item_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_tags/1
  # DELETE /item_tags/1.json
  def destroy
    @item_tag.destroy
    respond_to do |format|
      format.html { redirect_to item_tags_url, notice: 'Item tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_tag
      @item_tag = ItemTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_tag_params
      params.require(:item_tag).permit(:tag_number, :container_quantity, :auto_removed, :consumable_id)
    end
end
