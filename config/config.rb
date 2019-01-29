# Setup config for app from yaml file
CONFIG = YAML.load(File.read(File.expand_path('./config/partbox-config.yml')))
CONFIG.merge! CONFIG.fetch(Rails.env, {})
CONFIG.deep_symbolize_keys!
