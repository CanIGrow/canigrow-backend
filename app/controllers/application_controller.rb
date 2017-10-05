class ApplicationController < ActionController::API
  protect_from_forgery with: :exception
  
  include ActionController::HttpAuthentication::Token::ControllerMethods

  private

  def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        @user = User.find_by(token: token)
      end
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: {error: 'Bad credentials'}, status: :unauthorized
    end

    def current_user
      @user
    end

  # def verify_authentication
  #   render json: { error: "Restricted" }, status: :unauthorized
  # end
  #
  # unless user
  #     render json: { error: "Restricted" }, status: :unauthorized
  # end
end
