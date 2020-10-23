class QuickRemoveWorker
	  include Sidekiq::Worker
		
		def perform(item_tag, remove_quantity)
			logger.info "Quick Remove action started!"
			remove_tag = ItemTag.find_by(id: item_tag)
			logger.info remove_tag
			remove_consumeable = Consumable.find_by(id: remove_tag.consumable.id)
			logger.info "#{remove_consumeable.name}"
			
			#update the quantity on the consumable
			updated_q = remove_consumeable.quantity - remove_quantity
			remove_consumeable.quantity = updated_q
			remove_consumeable.save
			
			#update the status on the remove tag to auto_removed = true
			remove_tag.auto_removed = true
			remove_tag.save
			
			logger.info "quick remove complete"
			
		end
end