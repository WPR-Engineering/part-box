class AssetLabelLargeWorker
  include Sidekiq::Worker
  require 'prawn'


  def perform(asset_tag_id)
    logger.info "More Things are happening. Large Label"
    a_tag = AssetTag.find(asset_tag_id)
    tag_code = a_tag.tag
    consume_id = a_tag.consumable_id
    consume = Consumable.find(consume_id)
    partdb_id = consume.part_id
    consume_name = consume.name
    part_info = Part.find(partdb_id)
    mfg_parts = part_info.mfg_part

    logger.info "Working with the tag #{tag_code}"
    logger.info "Working with the consumable #{consume_name}"
    logger.info "The manufacture part number is #{mfg_parts}"

    replace = {
      '#TAG_CODE' => tag_code,
      '#PART_NUMBER' => mfg_parts,
      '#PART_DESCRPTION' => consume_name
    }
    tag_data = File.read(File.expand_path(CONFIG[:LABEL_PRINTING][:DEFAULT_LARGE_ZPL])).gsub(/#TAG_CODE|#PART_NUMBER|#PART_DESCRPTION/, replace)
      if CONFIG[:LABEL_PRINTING][:ENABLED]
        PRINT_EXCHANGE.publish tag_data, :routing_key => "print_queue"
        logger.info tag_data
      end
  end
end
