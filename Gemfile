# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'awesome_print'
gem 'cssbundling-rails', '~> 1.3'
gem 'devise', '~> 4.9', '>= 4.9.2'
gem 'foreman', '~> 0.87.2'
gem 'jsbundling-rails', '~> 1.2'
gem 'pg', '~> 1.1' # Postgres. Our beloved database.
gem 'pry', '~> 0.14.2'
gem 'puma', '~> 5.0' # The Webserver.
gem 'rails', '~> 7.0.7', '>= 7.0.7.2' # So rails. much wow. Many bugs.
gem 'slim-rails'
gem 'sprockets-rails' # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]

group :development do
  gem 'letter_opener', '~> 1.4', '>= 1.4.1'
  gem 'rubocop', require: false
end

group :development, :test do
  gem 'database_cleaner'
  gem 'factory_bot'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers', '~> 5.0'
end

gem 'dockerfile-rails', '>= 1.5', group: :development

gem 'sentry-ruby', '~> 5.11'

gem 'sentry-rails', '~> 5.11'
