class SearchController < ApplicationController
  def query
    @records = Searchkick.search params[:search], index_name: [AssetTag, FixedAsset, Consumable, Order, LineItem]

    #@records.delete_if { |record| cannot? :show, record }

    if @records.length == 1
      redirect_to @records.first
      return
    end

    respond_to do |format|
      format.html # query.html.erb
      format.json { render json: @records }
    end
  end
end
