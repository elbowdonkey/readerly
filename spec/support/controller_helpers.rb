module ControllerHelpers
  def http_login
    username = APP_CONFIG['general']['username']
    password = APP_CONFIG['general']['password']
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end
end
