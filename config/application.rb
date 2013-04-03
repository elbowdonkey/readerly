require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Reader
  class Application < Rails::Application    
    require File.expand_path("../../lib/extras/superfeedr_initializer", __FILE__) 

    config.encoding                                    = "utf-8"
    config.filter_parameters                           += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes          = true
    config.assets.enabled                              = true
    config.assets.version                              = '1.0'

    # Doing this instead of a initializer so we can use it to configure the middleware
    # in the next code block
    Configuration = YAML.load_file(Rails.root.join('config', 'config.yml'))

    config.middleware.use Rack::Superfeedr, SuperfeedrInitializer.params do |superfeedr|
      superfeedr.on_notification {|notification| Article.create_from_raw_notification(notification)}
    end
  end
end
