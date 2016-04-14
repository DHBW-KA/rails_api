class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  protected
  def authenticate
    return render json: {error: 'SSL connection required!'} unless request.ssl?
    request_http_token_authentication unless authenticate_with_http_token do |token, options|
      @current_user = User.find_by(api_key: token)
    end
  end

end
