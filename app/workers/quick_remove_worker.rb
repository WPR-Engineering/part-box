#this class is a background job that is kicked off when using the quick remove kiosk
class QuickRemoveWorker
	  include Sidekiq::Worker
		
		#call QuickRemoveWorker.perform_async(params) to kick this method off
		#params are item_tag, 
		def perform(item_tag, remove_quantity, direct)
			logger.info "Quick Remove action started!"
			
			if direct == true
			#logs
			remove_tag = ItemTag.find_by(id: item_tag)
			logger.info remove_tag.tag_number
			remove_consumeable = Consumable.find_by(id: remove_tag.consumable.id)
			logger.info "#{remove_consumeable.name}"
			
			
			PaperTrail.request.whodunnit = 'Kiosk'
			
			#update the quantity on the consumable
			updated_q = remove_consumeable.quantity - remove_quantity
			remove_consumeable.quantity = updated_q
			remove_consumeable.save
			
			#update the status on the remove tag to auto_removed = true
			remove_tag.auto_removed = true
			remove_tag.save
			
			logger.info "quick remove complete"
			
		else
			logger.info "this is a non direct removal"
			remove_tag = AssetTag.find_by(tag: item_tag)
			logger.info remove_tag
			remove_consumeable = remove_tag.consumable
			logger.info remove_consumeable.name
			updated_q = remove_consumeable.quantity - remove_quantity
			logger.info updated_q
			
			
			PaperTrail.request.whodunnit = 'Kiosk'
			
			remove_consumeable.quantity = updated_q
			remove_consumeable.save
			
			logger.info "done"
		end
			
		end
end