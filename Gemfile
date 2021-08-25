# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'apexcharts'
gem 'audited', '~> 4.4'
gem 'autocomplete_zipcode'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'breadcrumbs_on_rails' # Paths
gem 'chart-js-rails'
gem 'chartkick'
gem 'coffee-rails', '~> 4.2'
gem 'colorize'
gem 'dalli'
gem 'date_validator'
gem 'devise'
gem 'exception_notification'
gem 'font-awesome-sass', '~> 5.0.6'
gem 'groupdate'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari', '~> 1.0', '>= 1.0'
gem 'maskmoney-rails'
gem 'nested_form_fields'
gem 'newrelic_rpm'
gem 'nokogiri'
gem 'paperclip', '5.2.0'
gem 'paranoia', '~> 2.2'
gem 'pg', '~> 0.21.0'
gem 'prawn'
gem 'prawn-markup'
gem 'puma', '5.3.2'
gem 'rack-attack'
gem 'rack-cors'
gem 'rails', '~> 5.1.0'
gem 'rails-assets-sweetalert2', '~> 5.1.1', source: 'https://rails-assets.org'
gem 'ransack', '1.8.3'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'rest-client'
gem 'sass-rails', '~> 5.0'
gem 'select2-rails', '4.0.3'
gem 'sentry-raven'
gem 'simple_token_authentication', '~> 1.0' # see semver.org
gem 'slack-notifier'
gem 'simplecov', require: false, group: :test
gem 'simplecov-json'
gem 'sshkit'
gem 'sweet-alert2-rails'
gem 'therubyracer', platforms: :ruby
gem 'time_difference'
gem 'tinymce-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'whenever', require: false
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'


# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0']
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_bot_rails', '~> 4.11.1'
  gem 'faker'
  gem 'rails-erd'
  gem 'rspec-rails', '~> 3.5'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
  gem 'simplecov'
  gem 'slack-notifier'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'meta_request'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'toastr-rails'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

source 'https://rails-assets.org' do
  gem 'rails-assets-popper.js'
end
