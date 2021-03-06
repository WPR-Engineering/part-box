class AssetLabelSmallWorker
  include Sidekiq::Worker
  require 'prawn'


  def perform(asset_tag_id)
    logger.info "A Small Label Print was requested"
    a_tag = AssetTag.find(asset_tag_id)
    tag_code = a_tag.tag
    logger.info "Working with the tag #{tag_code}"
    tag_url = "#{CONFIG[:SYSTEM][:BASE_URL]}/#{tag_code}"
    
    replace = {
      '#TAG_URL' => tag_url,
      '#TAG_CODE' => tag_code,
    }

    tag_data = File.read(File.expand_path(CONFIG[:LABEL_PRINTING][:DEFAULT_SMALL_ZPL])).gsub(/#TAG_URL|#TAG_CODE/, replace)
      if CONFIG[:LABEL_PRINTING][:ENABLED]
        logger.info "Sent to Queue"
        PRINT_EXCHANGE.publish tag_data, :routing_key => "print_queue", :headers => {:printer => "#{CONFIG[:LABEL_PRINTING][:SMALL_PRINTER]}"}
        logger.info tag_data
      end
  end
end
