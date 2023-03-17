#this class is a background job that is kicked off when using the quick remove kiosk
class QuickRemoveWorker
	  include Sidekiq::Worker

		#call QuickRemoveWorker.perform_async(params) to kick this method off
		#params are item_tag,
		def perform(item_tag, remove_quantity, remove_source)
			logger.info "Quick Remove action started!"
				remove_tag = AssetTag.find_by(id: item_tag)
				remove_consumeable = Consumable.find_by(id: remove_tag.consumable.id)
			if remove_source == "asset"
				logger.info "Removing via consumable tag scan"
				logger.info "found consumable"
				logger.info "#{remove_consumeable.name}"
			else
			#logs
			remove_tag = ItemTag.find_by(id: item_tag)
			logger.info remove_tag.tag_number
			remove_consumeable = Consumable.find_by(id: remove_tag.consumable.id)
			logger.info "#{remove_consumeable.name}"
		end
			#update the quantity on the consumable
			updated_q = remove_consumeable.quantity - remove_quantity
			remove_consumeable.quantity = updated_q
			remove_consumeable.save(validate: false)

			if remove_source == "item"
			#update the status on the remove tag to auto_removed = true
			remove_tag.auto_removed = true
			remove_tag.save
			logger.info "quick remove via item tag complete."
		else
			logger.info "quick remove complete"
		end
		end
end
