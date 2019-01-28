# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

server "www.example.com", :app, :web, :db, :primary => true

set :application, "PartBox"
set :repo_url, "git@github.com/WPR-Engineering/part-box"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/#{ application }"

set :scm, :git
set :branch, "master"
set :user, "deployer"
set :scm_passphrase, ENV[deploy_password]
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy
set :keep_releases, 5
default_run_options[:pty] = true




desc "Symlink shared config files"
task :symlink_config_files do
    run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
end


desc "Restart Passenger app"
task :restart do
    run "#{ try_sudo } touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
end


after "deploy", "deploy:symlink_config_files"
after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"
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
