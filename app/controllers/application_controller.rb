class ApplicationController < ActionController::API
  before_action :verify_authentication

  def verify_authentication
    render json: { error: "Restricted" }, status: :unauthorized
  end
end
