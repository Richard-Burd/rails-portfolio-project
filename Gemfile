source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt'

# https://www.youtube.com/watch?v=UAvuo-EbTFY (5:10 / 56:18)
# OmniAuth Video
gem 'omniauth'
gem 'omniauth-github'


# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

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
  # gem 'capybara', '>= 2.15'
  # NOTE: This did not fix the problem (from 9/29/2019 @ 9:49 AM: at all
  gem 'capybara'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'pry'

# https://learn.co/tracks/full-stack-web-development-v7/rails/rails-models-basics/activerecord-models-and-rails
# We modified the Gemfile to include
# gem 'rspec-rails', '~> 3.0'

# getting this error message on 9/29/2019 @ 9:49 AM:
# undefined method `visit' for #<RSpec::ExampleGroups::Navigate:0x0000557508101080>
# ...while following this lesson here:
# https://learn.co/tracks/full-stack-web-development-v7/rails/intro-to-rest/rails-dynamic-request
# Will now try to update rspec and capybara to the latest versions:
gem 'rspec-rails'

# On 10/4/2019 @ 3:03pm I put this line:
# require 'capybara/rspec'
# at the top of this file:
# rails-sandbox-1/spec/spec_helper.rb
# and it gave me this error:

=begin
An error occurred while loading ./spec/models/post_spec.rb.
Failure/Error: require 'capybara-rails'

NameError:
  uninitialized constant Rails
# /var/lib/gems/2.5.0/gems/capybara-rails-0.0.2/lib/capybara-rails/railtie.rb:3:in `<module:Rails>'
# /var/lib/gems/2.5.0/gems/capybara-rails-0.0.2/lib/capybara-rails/railtie.rb:2:in `<module:Capybara>'
# /var/lib/gems/2.5.0/gems/capybara-rails-0.0.2/lib/capybara-rails/railtie.rb:1:in `<top (required)>'
# /var/lib/gems/2.5.0/gems/capybara-rails-0.0.2/lib/capybara-rails.rb:2:in `<top (required)>'
# ./spec/rails_helper.rb:3:in `<top (required)>'
# ./spec/models/post_spec.rb:5:in `<top (required)>'
No examples found.
=end

# So I tried to install the gem below, but that in fact generated more errors:
# gem 'capybara-rails'
# This is here for reference for me to explore latert on

# ...and capybara to the latest versions, see group: test do above
# NOTE: This did not fix the problem (from 9/29/2019 @ 9:49 AM: at all

# While trying to implement the controller tests on this lesson here:
# https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-6-validations-and-forms/rails-testing
# I get an error message saying to add this:
gem 'rails-controller-testing'
