if CONFIG[:NETBOX][:ENABLED]
  NetboxClientRuby.configure do |c|
    c.netbox.auth.token = CONFIG[:NETBOX][:API_KEY]
    c.netbox.api_base_url = [:NETBOX][:BASE_URL]
    config.faraday.logger = :logger
  end
end
