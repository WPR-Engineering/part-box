# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

#server "www.example.com", :app, :web, :db, :primary => true

set :application, "part-box"
set :repo_url, "git@github.com:WPR-Engineering/part-box.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/part-box"


set :branch, "master"
#set :user, "deployer"
#set :scm_passphrase, ENV[deploy_password]
set :use_sudo, false
set :keep_releases, 5
set :passenger_restart_with_touch, true

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/initializers/elasticsearch.rb', 'config/initializers/sidekiq.rb', 'config/partbox-config.yml' )
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rvm_ruby_version, '2.6.0'
set :rvm_type, :system


SSHKit.config.command_map[:sidekiq] = "bundle exec sidekiq"
SSHKit.config.command_map[:sidekiqctl] = "bundle exec sidekiqctl"
set :init_system, :upstart
set :upstart_service_name, 'sidekiq'
set :pty,  false
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
