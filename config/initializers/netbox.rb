if CONFIG[:NETBOX][:ENABLED]
  NetboxClientRuby.configure do |c|
    c.netbox.auth.token = "#{CONFIG[:NETBOX][:API_KEY]}"
    c.netbox.api_base_url = "#{CONFIG[:NETBOX][:BASE_URL]}"
    c.faraday.logger = :logger
  end
end
