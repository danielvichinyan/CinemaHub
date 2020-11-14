source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
# Use sqlite3 as the database for Active Record
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

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

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# jQuery-rails gem
gem 'jquery-rails', '~> 4.3', '>= 4.3.5'

# Bootstrap
gem 'bootstrap', '~> 4.3', '>= 4.3.1'
gem 'sprockets-rails', '~> 3.2', '>= 3.2.1', :require => 'sprockets/railtie'

# Sass CSS
gem 'sassc-rails', '>= 2.1.0'

# User Authentication using Devise gem
gem 'devise', '~> 4.7', '>= 4.7.1'

# User Authorization using Cancancan gem
gem 'cancancan'

# Geocoder
gem 'geocoder', '~> 1.6', '>= 1.6.2'

# Webpacker
gem 'webpacker', git: 'https://github.com/rails/webpacker.git'

# Image Upload
gem "paperclip", "~> 6.0.0"
gem 'world-flags', github: 'kristianmandrup/world-flags', branch: 'master'

# Forum
gem 'ransack', '~> 2.3', '>= 2.3.2'
gem 'record_tag_helper', '~> 1.0'
gem 'local_time'
gem 'will_paginate', '~> 3.3'

# Twitter Login
gem 'omniauth', '~> 1.9', '>= 1.9.1'
gem 'omniauth-twitter', '~> 1.4'

# React
gem 'react-rails'

# Testing
gem 'rails-controller-testing'

gem 'wdm', '>= 0.1.0' if Gem.win_platform?
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
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper', '1.2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]