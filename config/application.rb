require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"

Bundler.require(:default, Rails.env)

module Readerly
  class Application < Rails::Application
    config.encoding                                     = "utf-8"
    config.filter_parameters                            += [:password]
    config.active_support.escape_html_entities_in_json  = true
    config.assets.version                               = '1.0'
    config.i18n.locale                                  = :en
  end
end
