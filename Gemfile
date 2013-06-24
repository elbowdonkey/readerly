source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '~> 4.0.0.rc2'
gem 'activeresource', "~> 4.0.0.beta1", :require => 'active_resource'

gem 'rack-superfeedr'
gem 'htmlentities'
gem 'neat'
gem 'jquery-rails', '~> 2.2.2'

gem 'sass-rails',   '~> 4.0.0.rc2'
gem 'coffee-rails', '~> 4.0.0.rc2'
gem 'uglifier', '>= 1.3.0'

gem 'protected_attributes'

group :test, :development do
  gem 'rb-inotify', '~> 0.8.8', :require => false
  gem 'rb-fsevent', :require => false
  gem 'terminal-notifier-guard'
  gem 'rspec-rails', '~> 2.14.0.rc1'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'faker'
  gem 'launchy'
  gem 'simplecov', :require => false
end

group :development do
  gem 'sqlite3'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'annotate', ">=2.5.0"
end

group :production do
  gem 'pg'
  gem 'unicorn'
  gem 'rails_12factor'
end
