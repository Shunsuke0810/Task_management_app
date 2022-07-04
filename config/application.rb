require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TaskManagementApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically lo
    
    config.generators do |g|
      g.test_framework :rspec,
                      model_specs: true,
                      view_specs: false,
                      helper_specs: false,
                      routing_specs: false,
                      controller_specs: false,
                      request_specs: false
      # g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end
