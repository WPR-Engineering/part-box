class QuickRemoveController < ApplicationController
	
	def remove
	end
	
	def remove_lookup
		logger.info "quick remove lookup started"
		
		if params[:remove_tag].length > 8
			logger.info "shit its longggggg"
			
			scan_length = params[:remove_tag].length
			base_length = CONFIG[:SYSTEM][:BASE_URL].length
			final_length = scan_length - base_length - 1
			logger.info final_length
			final_string = params[:remove_tag].split(//).last(final_length).join
			logger.info final_string

			
		else
			@item_tag = ItemTag.find_by(tag_number: params[:remove_tag])
			logger.info @item_tag
			@sub_quantity =  @item_tag.consumable.sub_unit_quantity
			render :confirm
		end
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
