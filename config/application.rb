require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LegionBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.api_only = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:3000', 'localhost:4200', 'elderscrollslegion.herokuapp.com'
          resource '*',
          headers: :any,
          methods: [:get, :patch, :put, :delete, :post, :options]
      end
    end
  end
end
