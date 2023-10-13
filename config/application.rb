# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CafeApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    I18n.available_locales = [:de, :en]
    I18n.default_locale = :de

    if ENV['SENDGRID_API_KEY'].blank?
      puts 'WARNING! SENDGRID_API_KEY IS MISSING! MAILS WILL NOT WORK! PLEASE SET THIS UP!'
    else
      puts "Using ENV[SENDGRID_API_KEY] **********#{ENV['SENDGRID_API_KEY'].last(3)} for sending mails via Sendgrid"
    end

    if ENV['BUGSNAG_API_KEY'].blank?
      puts 'WARNING! BUGSNAG_API_KEY IS MISSING! EXCEPTION TRACKING WILL NOT WORK! PLEASE SET THIS UP!'
    else
      puts "Using ENV[BUGSNAG_API_KEY] **********#{ENV['BUGSNAG_API_KEY'].last(3)} for reporting errors to Bugsnag"
    end
  end
end
