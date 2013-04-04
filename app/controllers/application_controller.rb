class ApplicationController < ActionController::Base
  protect_from_forgery
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == APP_CONFIG['general']['username'] && password == APP_CONFIG['general']['password']
    end
  end

end
