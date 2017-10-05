class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :verify_authentication

  def verify_authentication
    render json: { error: "Restricted" }, status: :unauthorized
  end

  unless user
      render json: { error: "Restricted" }, status: :unauthorized
    end
  end

end
