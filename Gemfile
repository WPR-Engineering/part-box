source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
#use pgsql as the database
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use passenger as the app servers
gem 'passenger'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

group :development do
# Use Capistrano for deployment
  gem 'capistrano', '~> 3.11.0'
  gem 'capistrano-rails'
  gem 'capistrano-sidekiq', '1.0.2'
  gem "capistrano-rvm"
  gem "capistrano-passenger"
  gem "capistrano-yarn"
  gem 'development_ribbon'
  gem 'rainbow'

end

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rspec-rails'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'guard-rspec'
end

gem 'codecov', :require => false, :group => :test

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# use haml rather than erb
gem 'haml'

#authentication
gem 'devise'
gem 'net-ldap'
gem 'devise_ldap_authenticatable'

#fine grain uer authentication and roles
gem 'cancancan'

#history/change tracking
gem 'audited', '~> 5.3'
#possibly migrating to papaer-trail
gem 'paper_trail'
gem 'paper_trail-association_tracking'
gem 'rails_admin_history_rollback'

#nested forms
gem 'cocoon'
gem 'jquery-rails'

#better forms
gem 'simple_form'

#use bootstrap cuz im lazy on this project
gem 'bootstrap', '~> 4.3.1'

#sidekiq for job processing
gem 'sidekiq', "< 7.0.0"
gem 'sinatra', require: false
gem 'slim'
gem 'sidekiq-status'

#label printing
#pdf writer
gem 'prawn-rails'
#qr codes
gem 'rqrcode'
gem 'prawn'
gem 'prawn-qrcode'

#use searchkick for best search!
gem 'searchkick'
gem "elasticsearch", "< 8.0.0"

#bunny
gem "bunny", ">= 2.13.0"

#netbox api
gem 'netbox-client-ruby'

#building an API for the app
gem 'grape'
gem 'grape-swagger'
gem 'rack-cors'
gem 'grape-active_model_serializers'

#super db admin page because im lazy like that
gem 'rails_admin', '~> 3.1'
