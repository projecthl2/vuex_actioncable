require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SyncTodo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      g.template_engine = :haml
      g.test_framework :rspec,
        fixture: true,
        fixture_replacement: :fabrication,
        view_specs: false,
        routing_specs: false,
        helper_specs: false,
        controller_specs: false
      g.fabrication dir: "spec/fabricators"
      g.assets false
      g.helper false
      g.jbuilder false
      g.system_tests = nil
    end
  end
end
