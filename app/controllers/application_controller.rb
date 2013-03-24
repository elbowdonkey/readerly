class ApplicationController < ActionController::Base
  protect_from_forgery
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Reader::Application::Configuration['general']['username'] && password == Reader::Application::Configuration['general']['password']
    end
  end

end
