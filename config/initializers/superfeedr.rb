APP_CONFIG = YAML.load_file(Rails.root.join('config', 'config.yml'))

superfeedr_config =  { 
      :host     => APP_CONFIG["general"]["hostname"], 
      :login    => APP_CONFIG["superfeedr"]["username"], 
      :password => APP_CONFIG["superfeedr"]["password"] 
}

Rails.configuration.middleware.use Rack::Superfeedr, superfeedr_config do |superfeedr|
    superfeedr.on_notification {|notification| Article.create_from_raw_notification(notification)}
end