source 'http://rubygems.org'

gem 'rails', '3.0.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg', :require => 'pg', :group => [:production]

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

# gem 'coffee-script'
gem 'jquery-rails'
gem 'haml-rails'
gem 'compass'
gem 'simple_form'

gem 'devise'
gem 'omniauth'

gem 'thin', :group => [:development, :test]

gem 'rspec-rails', :group => [:development, :test]
gem "nifty-generators", :group => :development

group :test do
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'spork', '~> 0.9.0.rc'  
  gem 'jasmine'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem "mocha"
 
  gem 'rb-fsevent'
  gem 'growl'

  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-cucumber'
  gem 'guard-sass'
  gem 'guard-haml'
  gem 'guard-bundler'
  gem 'guard-coffeescript'
end