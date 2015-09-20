# config valid only for current version of Capistrano
lock '3.4.0'
application = 'lms'

set :application, application
set :repo_url, 'git@github.com:szareey/LSM.git'

set :rbenv_type, :user
set :rbenv_ruby, '2.2.3'

set :deploy_to, '/var/www/apps/' + application

set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH",
}

namespace :foreman do
  desc 'Start server'
  task :start do
    on roles(:all) do
      sudo "systemctl start #{application}.target"
    end
  end

  desc 'Stop server'
  task :stop do
    on roles(:all) do
      sudo "systemctl stop #{application}.target"
    end
  end

  desc 'Restart server'
  task :restart do
    on roles(:all) do
      sudo "systemctl restart #{application}.target"
    end
  end

  desc 'Server status'
  task :status do
    on roles(:all) do
      execute "initctl list | grep #{application}"
    end
  end
end

namespace :deploy do

  desc 'Setup'
  task :setup do
    on roles(:all) do
      execute "mkdir -p #{shared_path}/config/"
      execute "mkdir -p /var/www/log"
      execute "mkdir -p /var/www/apps/#{application}/run/"
      execute "mkdir -p /var/www/apps/#{application}/log/"
      execute "mkdir -p /var/www/apps/#{application}/socket/"
      execute "mkdir -p /var/www/log"

      
      upload!('shared/Procfile', "#{shared_path}/Procfile")
      upload!('shared/database.yml', "#{shared_path}/database.yml")
      upload!('shared/nginx.conf', "#{shared_path}/nginx.conf")

      sudo 'service nginx stop'
      sudo "rm -f /etc/nginx/nginx.conf"
      sudo "ln -s #{shared_path}/nginx.conf /etc/nginx/nginx.conf"
      sudo 'service nginx start'

      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:create"
        end
      end
    end
  end

  desc 'Create symlink'
  task :symlink do
    on roles(:all) do
      sudo "rm -f #{release_path}/Procfile"
      execute "ln -s #{shared_path}/Procfile #{release_path}/Procfile"
      execute "ln -s #{shared_path}/system #{release_path}/public/system"

      execute "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
    end
  end

  desc 'Foreman init'
  task :foreman_init do
    on roles(:all) do
      foreman_temp = "/var/www/tmp/foreman"
      execute  "mkdir -p #{foreman_temp}"

      #execute "ln -s #{release_path} #{current_path}"
      
      within current_path do
        execute "cd #{current_path}"
        execute "~/.rbenv/bin/rbenv exec foreman export systemd #{foreman_temp} -a #{application} -u deployer -l /var/www/apps/#{application}/log -d #{current_path}"
      end
      sudo "mv #{foreman_temp}/* /etc/systemd/system"
      sudo "rm -r #{foreman_temp}"
    end
  end

  after :finishing, 'deploy:cleanup'
  after :finishing, 'foreman:restart'
  after :updating, 'deploy:symlink'
  after :setup, 'deploy:foreman_init'

  after :foreman_init, 'foreman:restart'
  before :setup, 'deploy:starting'
  before :setup, 'deploy:updating'
  before :setup, 'bundler:install'
end