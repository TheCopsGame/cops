require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Cops
  class Application < Rails::Application
    config.load_defaults 5.2
    config.autoload_paths << Rails.root.join('lib')

    config.time_zone = ENV.fetch('TZ', 'Brasilia')
    config.i18n.enforce_available_locales = true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    config.i18n.default_locale = :'pt-BR'
    config.i18n.locale = :'pt-BR'

    config.generators do |g|
      g.assets false
      g.helper false
      g.stylesheets false
    end
  end
end
