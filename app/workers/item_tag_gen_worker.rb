class ItemTagGenWorker
  include Sidekiq::Worker
  
  def perform(consumable_id, quantity)
    PaperTrail.request.whodunnit = 'Item tag generator'
    logger.info "generating #{quantity} new item tags"
    real_quantity = quantity.to_i
    i = 0
    while i < real_quantity
    
    random_number = "R#{Date.today.yday()}#{SecureRandom.random_number(100000)}"
    logger.info random_number
    
    item_tag_new = ItemTag.new
    item_tag_new.tag_number = random_number
    item_tag_new.consumable_id = consumable_id
    #item_tag_new.container_quantity = container_quantity
    logger.info "entering new item tag #{item_tag_new.inspect}"
    item_tag_new.save
    logger.info "printing tag!"
    
    most_recent_tag = ItemTag.order("created_at").last
    item_tag_code = most_recent_tag.tag_number
    
    tag_data = File.read(File.expand_path(CONFIG[:LABEL_PRINTING][:DEFAULT_REMOVE_ZPL])).gsub(/#TAG_CODE/, item_tag_code)
      if CONFIG[:LABEL_PRINTING][:ENABLED]
        logger.info "tag sent to queue"
        PRINT_EXCHANGE.publish tag_data, :routing_key => "print_queue", :headers => {:printer => "#{CONFIG[:LABEL_PRINTING][:ITEM_TAG_PRINTER]}"}
        logger.info tag_data
      end
    
    i += 1
    logger.info i
    end
  end
end