lock '3.3.5'

#main
set :application, 'olympic'
set :repo_url, 'git@github.com:db87987/olympic.git'
set :deploy_to, '/home/deploy'
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

#rbenv
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.2.3'
set :rbenv_path, '~/.rbenv'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby}
set :rbenv_roles, :all # default value

namespace :deploy do
  desc 'Restart application server'
  task :restart do
    on roles(:app) do
      execute 'cd /home/deploy/current && ( RBENV_ROOT=~/.rbenv RBENV_VERSION=2.2.3 RACK_ENV=production ~/.rbenv/bin/rbenv exec bundle exec puma -C /home/deploy/shared/puma.rb --daemon )'
    end
  end
  after :published, 'deploy:restart'
end