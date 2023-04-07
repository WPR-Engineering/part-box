class RemoveStockWorker
  include Sidekiq::Worker

  def perform(order_num)
    logger.debug "Checking order status."
    #order = Order.find(order_num)
    order = Order.find(order_num)
    if order.finalized?
      LineItem.where(order_id: "#{order_num}").find_each do |lines|
        remove_amount = lines.quantity
        remove_from_id = lines.consumable_id
        logger.debug "Order marked for finalization, passing this into the update: removing #{remove_amount} from consumable with ID "
        consume = Consumable.find("#{remove_from_id}")
        puts consume
        current_quantitiy = consume.quantity
        puts current_quantitiy

        @updated_q = current_quantitiy - remove_amount
        puts @updated_q

        puts consume.quantity

        logger.info "Here is the new quantity #{@updated_q}"
        new_quantity = @updated_q
        consume.quantity = new_quantity
        consume.save

        logger.debug "Setting the order status"
        order.status = "Finalized"
        order.save
      end
      else
        logger.debug "Nothing to do, order not done yet."

    end
  end
end
