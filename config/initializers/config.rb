# Setup config for app from yaml file
CONFIG = YAML.safe_load(ERB.new(File.read('./config/partbox-config.yml')).result)
CONFIG.merge! CONFIG.fetch(Rails.env, {})
CONFIG.deep_symbolize_keys!
