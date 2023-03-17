class QuickRemoveController < ApplicationController

	def remove
	end

	def remove_lookup
		logger.info "quick remove lookup started"
		if params[:remove_tag].include?("http")
			tag_uri = params[:remove_tag]
			logger.info "stripping URL"
			#TODO Pull the URL of the site from the config file rather than hard coding it
			asset_tag_number = tag_uri.gsub("#{CONFIG[:SYSTEM][:BASE_URL]}, '')
			@asset_tag = AssetTag.find_by(tag: asset_tag_number)
			logger.info @asset_tag.tag
			render :confirm
		else
		@item_tag = ItemTag.find_by(tag_number: params[:remove_tag])
		logger.info @item_tag
		render :confirm
	end

	def remove_confirm
		logger.info "quick remove confirmed"
		@item_tag = params[:remove_tag].to_i
		@remove_quantity = params[:remove_quantity].to_i
		logger.info "#{@item_tag}"
		if params[:remove_source] == "item"
					logger.info "checking if this tag has been removed"
					checker = ItemTag.find_by(id: @item_tag)
					if checker.auto_removed == true
						logger.error "Tag has already been removed"
						redirect_back fallback_location: '/', alert: "This tag has already been removed from stock!"
					end
				else
		QuickRemoveWorker.perform_async(@item_tag, @remove_quantity, params[:remove_source])
		redirect_back fallback_location: '/', notice: "Done!"
	end
	end
end
end
