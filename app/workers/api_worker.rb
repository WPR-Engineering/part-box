class ApiWorker
	  include Sidekiq::Worker
		
		def perform(word)
			logger.info "this came from the API"
			logger.info word
			return word
		end
end