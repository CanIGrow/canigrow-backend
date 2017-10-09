class PlotsController < ApplicationController
  before_action :get_user, except: %i[destroy]

  def create
    @plot = Plot.new(plot_params)
    @plot.user_id = @user.id
    if @plot.save
      render status: :created
    else
      render json: {
        errors: @plot.errors
      }, status: :bad_request
    end
  end

  private

  def plot_params
    params.require(:plot).permit(:name, :user_id)
  end

  def get_user
    @user = User.find(params[:user_id])
  end

end
