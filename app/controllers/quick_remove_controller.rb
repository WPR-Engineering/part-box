class QuickRemoveController < ApplicationController
	
	def remove
	end
	
	def remove_lookup
		logger.info "quick remove lookup started"
		@item_tag = ItemTag.find_by(tag_number: params[:remove_tag])
		logger.info @item_tag
		render :confirm
	end
	
	def remove_confirm
		logger.info "quick remove confirmed"
		@item_tag = params[:remove_tag].to_i
		@remove_quantity = params[:remove_quantity].to_i
		logger.info "DOES THIS WORK??????????????????? #{@item_tag}"
		QuickRemoveWorker.perform_async(@item_tag, @remove_quantity)
		redirect_back fallback_location: '/', notice: "Done!"
	end
	
	
end
