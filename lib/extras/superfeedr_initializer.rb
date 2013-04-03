module SuperfeedrInitializer
  def self.params
    { 
      :host     => Reader::Application::Configuration["general"]["hostname"], 
      :login    => Reader::Application::Configuration["superfeedr"]["username"], 
      :password => Reader::Application::Configuration["superfeedr"]["password"] 
    }
  end
end