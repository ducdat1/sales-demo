require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Trainingap
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += Dir["#{config.root}/app/forms/**/"]
    config.autoload_paths += Dir["#{config.root}/app/queries/**/"]
    config.autoload_paths += Dir["#{config.root}/app/services/**/*.rb"]
    config.autoload_paths += Dir["#{config.root}/app/policy/**/"]

    config.time_zone = "Asia/Bangkok"
    config.i18n.default_locale = :vi
    I18n.available_locales = [:en, :vi]
    config.i18n.load_path += Dir["#{config.root}/config/locales/*.yml"]
  end
end
