class DashboardController < ApplicationController
	#cancancan
  load_and_authorize_resource
	def index
		@fixed_assets = FixedAsset.all
		@count = FixedAsset.all.count
		@consumables = Consumable.all
	  end
end
