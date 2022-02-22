# frozen_string_literal: false

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'
gem 'aasm', '~> 5.1', '>= 5.1.1'
gem 'authy', '~> 3.0'
gem 'aws-sdk-s3', '~> 1.96', '>= 1.96.1'
gem 'bootstrap', '~> 4.6'
gem 'cocoon', '~> 1.2', '>= 1.2.15'
gem 'devise', github: 'heartcombo/devise', branch: 'ca-omniauth-2'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'active_storage_validations', '~> 0.9.3'
gem 'elasticsearch-model', '~> 7.1', '>= 7.1.1'
gem 'elasticsearch-rails', '~> 7.1', '>= 7.1.1'
gem 'faker', '~> 2.17'
gem 'jquery-rails', '~> 4.4'
gem 'omniauth-google-oauth2'
gem 'pagy', '~> 4.8'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
gem 'rubocop', '~> 1.12', '>= 1.12.1'
gem 'rubocop-rails', '~> 2.9', '>= 2.9.1', require: false
gem 'sidekiq', '~> 6.2', '>= 6.2.1'
gem 'sidekiq-scheduler', '~> 3.1'
gem 'wicked', '~> 1.3', '>= 1.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
gem 'pry', '~> 0.14.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
gem 'slim', '~> 4.1'
gem 'slim-rails', '~> 3.2'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'envyable', '~> 1.2'
gem 'omniauth', '~> 2.0', '>= 2.0.4'
gem 'phonelib', '~> 0.6.49'
gem 'twilio-ruby', '~> 5.51'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'bullet', '~> 6.1', '>= 6.1.4'
  gem 'letter_opener', '~> 1.7'
  gem 'rails-erd', '~> 1.6', '>= 1.6.1'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'factory_bot', '~> 6.2'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
  gem 'simplecov', '~> 0.21.2'
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'devise-i18n', '~> 1.9', '>= 1.9.3'
gem 'i18n', '~> 1.8', '>= 1.8.10'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'omniauth-rails_csrf_protection', '~> 1.0'
gem 'omniauth-twitter', '~> 1.4'

gem 'jsonapi-serializer', '~> 2.2'
