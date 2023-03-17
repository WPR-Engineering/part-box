class TagMakerWorker
  include Sidekiq::Worker

  def perform(type, new_asset_id)

    if type == "fixed"

      #set everything up

      logger.info "Fixed asset tag"

      logger.info "The ID of the newly created asset is #{new_asset_id}"


      #lets handle a fresh database properly
        if AssetTag.first.nil?

        logger.info "The DB is empty, lets make our first record"
        asset_tag_new = AssetTag.new
        asset_tag_new.id = "1"
        asset_tag_new.tag = "FA-00001"
        asset_tag_new.location_id = "1"
        asset_tag_new.fixed_asset_id = new_asset_id
        logger.info "the new values going into the database are #{asset_tag_new.inspect}"
        asset_tag_new.save(validate: false)
        AssetTag.reindex

      else
        #selecting the last tag that was created for a fixed asset
        select_last_tag = AssetTag.where(consumable_id: [nil, ""]).order(created_at: :asc).last
        logger.info "the prevous asset tag ID = #{select_last_tag.tag}"

        #set things to variables
        last_tag_num = select_last_tag.tag
        next_tag = last_tag_num.succ

        #create a new asset tag, and link the newest asset
        asset_tag_new = AssetTag.new
        asset_tag_new.tag = next_tag
        asset_tag_new.location_id = "1"
        asset_tag_new.fixed_asset_id = new_asset_id
        logger.info "the new values going into the database are #{asset_tag_new.inspect}"
        asset_tag_new.save(validate: false)

        AssetTag.reindex

      end

    else
      logger.info "Consumable tag"
      logger.info new_asset_id

    #lets handle a fresh database properly
      if AssetTag.first.nil?

        logger.info "The DB is empty, lets make our first record"
        asset_tag_new = AssetTag.new
        asset_tag_new.tag = "CON-00001"
        asset_tag_new.consumable_id = new_asset_id
        asset_tag_new.location_id = "1"
        logger.info "the new values going into the database are #{asset_tag_new.inspect}"
        asset_tag_new.save(validate: false)

        AssetTag.reindex


      else
      #select the last tag that was created for a consumable
      select_last_tag = AssetTag.where(fixed_asset_id: [nil, ""]).order(created_at: :asc).last
      logger.info "the prevous asset tag ID = #{select_last_tag}"



        #set things to variables
        last_tag_num = select_last_tag.tag
        next_tag = last_tag_num.succ

        #create a new asset tag, and link the newst asset
        asset_tag_new = AssetTag.new
        asset_tag_new.tag = next_tag
        asset_tag_new.consumable_id = new_asset_id
        asset_tag_new.location_id = "1"
        logger.info "the new values going into the database are #{asset_tag_new.inspect}"
        asset_tag_new.save(validate: false)

        AssetTag.reindex

      end

    end
  end
end
