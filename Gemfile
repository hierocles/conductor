# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.3'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'nokogiri', '~> 1.13.6'

gem 'redis', '~> 4.7.1'

gem 'sidekiq', '~>6.5.1'

gem 'sidekiq-cron', '~>1.6.0'

gem 'activerecord-import', '~> 1.4.0'

gem 'grape', '~> 1.6'

gem 'rack-cors', '~> 1.1'

gem 'grape-active_model_serializers', '~> 1.5'

gem 'rack-attack'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'grape_on_rails_routes', '~> 0.3.2'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end
