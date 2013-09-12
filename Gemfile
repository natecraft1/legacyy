source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'binding_of_caller'

# Use sqlite3 as the database for Active Record
# gem "pg", "~> 0.16.0"
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'pg'
gem 'paperclip', "~> 3.0"
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem 'gon'
gem 'rabl'
gem 'awesome_print'
gem 'figaro'


# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
gem 'slim'

gem 'simple_form', '~> 3.0.0.rc'
gem 'client_side_validations', git: 'git://github.com/bcardarella/client_side_validations.git', branch: '4-0-beta'
gem 'client_side_validations-simple_form', git: 'git://github.com/saveritemedical/client_side_validations-simple_form.git'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'aws-sdk'


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
	 gem 'better_errors'
   gem 'rspec-rails'
   gem 'capybara'
   gem "capybara-webkit"
   gem 'guard-rspec'
   gem 'database_cleaner'
end

group :test do
  gem 'factory_girl_rails', '4.2.1'
  gem "launchy"
  gem "selenium-webdriver", "~> 2.35.1"
end
group :production do
	# gem "pg", "~> 0.16.0"
	gem 'rails_12factor', '0.0.2'
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', require: 'bcrypt'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
