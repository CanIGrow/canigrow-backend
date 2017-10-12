class PlotsController < ApplicationController
  before_action :authenticate, only: [:create, :destroy, :update, :rename]
  before_action :current_user, only: [:create, :destroy, :update, :rename]
  before_action :set_plot, except: [:create, :index, :rename]
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
      render json: {errors: @plot.errors}, status: :bad_request
    end
  end

  def destroy
    if current_user_owns_plot
      @plot.destroy
      render json: {message: "You have deleted a plot", plot_id: @plot.id, plot_name: @plot.name}
    else
      render json: {error: "You're not authorized to complete this action"}, status: :unauthorized
    end
  end

# To move, copy, or delete a plant:

  def update
    if current_user_owns_plot
      if params[:plant_id].present?
        @plant = Plant.find(params[:plant_id])
      end
      if params[:new_plot].present?
        @new_plot = Plot.find(params[:new_plot])
        @new_plot.plants << @plant
      end
      unless params[:copy] == 'yes'
        @plot.plants.delete(@plant)
      end
      if params[:name].present?
        @plot.update(plot_params)
      end
      render 'users/show'
    else
      render json: {error: "You're not authorized to complete this action"}, status: :unauthorized
    end
  end
  
  private

  def plot_params
    params.require(:plot).permit(:name, :user_id)
  end

  def current_user_owns_plot
    if @plot.user_id == @current_user.id
      return true
    else
      return false
    end
  end

  def set_plot
    @plot = Plot.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end
end
