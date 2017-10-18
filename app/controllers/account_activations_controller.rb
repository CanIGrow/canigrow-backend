class AccountActivationsController < ApiController
  def create
    #user submits email address to get another account activation email
    @user = User.find_by(email: params[:email])
    if !@user
      render json: {message: "An account for that email does not exist."}
    elsif @user && !@user.activated?
      @user.recreate_activation_digest
      @user.send_activation_email
      render json: {message: "A new account activation email has been sent the address you provided."}
    else
      render json: {message: "Your account has already been activated."}
    end
  end


  def activate
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      render json: {message: "account activated"}, status: :created
      # flash[:success] = "Account activated!"
      # redirect_to user
    elsif user && !user.activated?
      render json: {message: "account is already active"}
    else
      render json: {message: "Invalid activation link"}
      # flash[:danger] = "Invalid activation link"
      # redirect_to root_url
    end
  end


end
