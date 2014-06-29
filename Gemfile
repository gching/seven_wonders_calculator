source 'https://rubygems.org'
# use Ruby version 2.0
ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# For handling environment variables
gem 'figaro'

## To properly set up assets for Heroku with Rails 4 --Ck_editor does not work
gem 'rails_12factor', group: :production

group :development, :test do
  ## Below are used for testing
  gem 'rspec-rails',  '~> 2.14.0'
  gem 'rspec-nc'
  gem 'factory_girl_rails', '~> 4.2.1', :require => false
  ## Add it to bundle as guard-rails requires it to use.
  gem 'zeus'
  gem 'capybara', '~> 2.1.0'
  gem 'database_cleaner'
  gem 'faker'
end

group :test do
  ## Used for browser automation and coverage
  gem 'selenium-webdriver'
  gem 'simplecov'
end

group :development do
  ## Used for testing and shell
  gem 'pry'
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'guard-rails'
  gem 'guard-rspec', require: false
  gem 'rack-mini-profiler'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
