# frozen_string_literal: true

require_relative "boot"
require "csv"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module Frontend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.api_only = false
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "*"
        resource "*",
          headers: :any,
          methods: %i(get post put patch delete options head)
      end
    end
    config.middleware.use Rack::Attack
    config.i18n.default_locale = "pt-BR"
    config.to_prepare do
      DeviseController.respond_to :html, :json
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = "America/Fortaleza"
    # config.active_record.default_timezone = :local
    config.eager_load_paths << Rails.root.join("lib", "breadcrumbs")
    config.autoload_paths += %W(#{config.root}/lib)
    config.filter_parameters << :password
  end
end
