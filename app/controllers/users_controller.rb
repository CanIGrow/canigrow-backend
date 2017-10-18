class UsersController < ApiController
 before_action :get_user, only: [:update, :destroy]
 before_action :authenticate, only: [:update, :destroy]
 before_action :current_user, only: [:update, :destroy]

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(username: params[:username])
    render :show
  end

  def create
    @user = User.new(user_params)
    @plot = Plot.new(:name => "My First Plot")
    @plant = Plant.limit(1).order("RANDOM()")
    @plot.plants << @plant
    @user.plots << @plot
    if @user.save
      @user.send_activation_email
      render status: :created
    else
      render json: {errors: @user.errors}, status: :bad_request
    end
  end

  def update
    if @user.id == @current_user.id
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: {errors: "unauthorized"}, status: :unauthorized
    end
  end

  def login
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if !@user
      render status: :unauthorized, json: {"error": "There is no user with that username and password."}
    elsif @user.activated? == false
      render json: {message: "You have not yet activated your account. Check your email for the activation link.", user_id: @user.id, username: @user.username, email: @user.email}
    else
      render json: {user_id: @user.id, username: @user.username, token: @user.api_token, bio: @user.bio}
    end
  end

  # def activation
  #   #user submits email address to get another account activation email
  #   @user = User.find_by(email: params[:email])
  #   if !@user
  #     render json: {message: "An account for that email does not exist."}
  #   elsif @user && !@user.activated?
  #     @user.create_activation_digest
  #     @user.send_activation_email
  #   else
  #     render json: {message: "Your account has already been activated."}
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:username, :password, :bio, :location, :email, :activation_digest, :location_private, :twitter, :facebook, :avatar)
  end

  def get_user
    @user = User.find_by(username: params[:username])
  end

end
