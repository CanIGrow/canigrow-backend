class UsersController < ApplicationController

  def index
      @users = User.all
      render :index
    end

    def show
      @user = User.find(params[:id])
      render :show
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render status: :created
      else
        render json: {
          errors: @user.errors
        }, status: :bad_request
      end
    end

    def login
      user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

      if !user
        render status: :unauthorized, json: {
          "error": "There is no user with that username and password."
        }
      else
        render json: {token: user.token, user_id: user.id}
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :password, :bio, :location, :email)
    end

end
