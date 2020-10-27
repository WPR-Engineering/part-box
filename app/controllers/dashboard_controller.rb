class DashboardController < ApplicationController
	def index
		@fixed_assets = FixedAsset.all
		@count = FixedAsset.all.count
		@consumables = Consumable.all
	  end
end
