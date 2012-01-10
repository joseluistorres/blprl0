require "bundler/capistrano"
set :application, "vulcanik.com"
set :rails_env, "production"
set :branch, "master"  
set :git_repository, "github.com:flgm-repo"  
set :repository, "git@#{git_repository}/blprl0.git"
set :deploy_to, "/var/www/#{application}"
set :domain, "50.56.227.111"

role :app, domain
role :web, domain
role :db,  domain, :primary => true

set :deploy_via, :remote_cache
set :scm, "git"

set :user, "captain"
set :use_sudo, false
set :scm_passphrase, "rebecca"
set :port, 23962
default_run_options[:pty] = true 
set :keep_releases, 3

# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

# Load RVM's capistrano plugin.    
require "rvm/capistrano"

set :rvm_ruby_string, '1.9.2-p290'
set :rvm_type, :user
#set :bundle_dir,      File.join(fetch(:shared_path), 'bundle')

namespace :deploy do
  task :default do
    update
    #restart
    cleanup
  end
end
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end