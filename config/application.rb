# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Conductor
  #
  # Application configuration
  #
  class Application < Rails::Application
    config.version = '0.0.1'
    config.time_zone = 'Eastern Time (US & Canada)'

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Set a UserAgent as required by NationStates API rules
    # Should include account name & alternative contact method
    # Do not remove "Conductor" from the UserAgent
    config.outbound_user_agent = 'Conductor <Sandaoguo | dylan.hierocles at gmail.com>'

    # Define CORS for the API
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: %i[get options]
      end
    end
  end
end
