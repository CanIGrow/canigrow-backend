class PasswordResetsController < ApplicationController
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
end