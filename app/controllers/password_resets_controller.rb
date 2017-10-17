class PasswordResetsController < ApiController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      # flash[:info] = "Email sent with password reset instructions"
      # redirect_to root_url
      render json: {message: "email sent with password reset instructions"}
    else
      render json: {message: "email address not found"}
      # flash.now[:danger] = "Email address not found"
      # render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?                  # Case (3)
      @user.errors.add(:password, "can't be empty")
      render json: @user.errors
    elsif @user.update_attributes(user_params)          # Case (4)
      render json: {message: "password has been reset"}
    else
      render json:{message: "invalid password"}                                     # Case (2)
    end
  end

  private

  def user_params
      params.require(:user).permit(:password)
    end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # Confirms a valid user.
  def valid_user
    unless (@user && @user.activated? &&
            @user.authenticated?(:reset, params[:id]))
      render json: {message: "not a valid user"}
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      render json: {message: "password reset has expired"}
    end
  end
end
