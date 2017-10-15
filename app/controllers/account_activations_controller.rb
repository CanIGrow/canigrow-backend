class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      render status: :created
      # flash[:success] = "Account activated!"
      # redirect_to user
    else
      render json: {message: "Invalid activation link"}
      # flash[:danger] = "Invalid activation link"
      # redirect_to root_url
    end
  end
end
