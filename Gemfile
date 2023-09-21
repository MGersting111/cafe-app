source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 7.0.7", ">= 7.0.7.2" # So rails. much wow. Many bugs.
gem "sprockets-rails"   # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "pg", "~> 1.1"      # Postgres. Our beloved database.
gem "puma", "~> 5.0"    # The Webserver.

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
# login
gem 'devise', '~> 4.9', '>= 4.9.2'

#emails
gem 'letter_opener', '~> 1.4', '>= 1.4.1'
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "awesome_print"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "pry", "~> 0.14.2"

gem "cssbundling-rails", "~> 1.3"

gem "foreman", "~> 0.87.2"

gem "jsbundling-rails", "~> 1.2"

gem "slim-rails"
