class PlotsController < ApplicationController
  before_action :authenticate, only: [:create, :destroy, :update]
  before_action :current_user, only: [:create, :destroy, :update]
  before_action :set_plot, except: [:create, :index]
  before_action :get_user, only: [:index]

  def index
    render :index
  end

  def create
    @plot = Plot.new(plot_params)
    @plot.user_id = @current_user.id
    if @plot.save
      render status: :created
    else
      render json: {
        errors: @plot.errors
      }, status: :bad_request
    end
  end

  def destroy
    if @plot.user_id == @current_user.id
      id = @plot.id
      name = @plot.name
      @plot.destroy
      render json: {message: "You have deleted a plot", plot_id: id, plot_name: name}
    else
      render json: {error: "You're not authorized to complete this action"}, status: :unauthorized
    end
  end

  def update
    if @plot.user_id == @current_user.id
       @plot.update(plot_params)
       render 'users/show'
    else
      render json: {error: "You're not authorized to complete this action"}, status: :unauthorized
    end
  end

  private

  def plot_params
    params.require(:plot).permit(:name, :user_id)
  end

  def set_plot
    @plot = Plot.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end
end
