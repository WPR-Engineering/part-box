class TagMakerWorker
  include Sidekiq::Worker

  def perform(type)
    logger.info "Tag creation starting"
  
  end

end
