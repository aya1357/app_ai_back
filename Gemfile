source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.8", ">= 7.0.8.3"

gem "bootsnap", require: false

gem 'cssbundling-rails'

gem 'dotenv-rails'

gem 'faraday'

gem 'jsbundling-rails'

gem "importmap-rails"

gem "jbuilder"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

gem 'ridgepole'

gem "sprockets-rails"

gem "stimulus-rails"

gem "turbo-rails"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end
