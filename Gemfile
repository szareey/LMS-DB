source 'https://rubygems.org'

gem "paperclip", "~> 4.3"
gem 'tux'
gem 'byebug'
gem 'railties'
# gem 'ministry_docs'

#gem 'bootstrap-sass', '~> 3.3.5'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'materialize-sass', github: 'mkhairi/materialize-sass'
gem 'sassc-rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1'

gem 'omniauth-google-oauth2', '~> 0.2'

gem 'ministry_docs', git: 'git@github.com:szareey/ministryDocs.git'
# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'rails_admin'

gem 'foreman'

group :development, :test do
  gem 'annotate'
  gem 'rspec-rails', '~> 3.0'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'quiet_assets'
  gem 'spring'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
end

group :production do
  gem 'unicorn'
end