class PlantsController < ApiController
  before_action :authenticate, only: [:update, :favorite, :destroy]
  before_action :current_user, only: [:favorite, :update, :destroy]
  before_action :has_plot, only: [:favorite]

  def index
    @plants = Plant.all
    render :index
  end

  def show
    @plant = Plant.find(params[:id])
    render :show
  end

  def favorite
    @plant = Plant.find(params[:plant_id])
    if params[:id]
      @plot = Plot.find_by(id: params[:id])
    else
      @plot = Plot.new(plot_params)
      @plot.user_id = @current_user.id
      @plot.save!
    end
    if @plot.plants.exists?(@plant.id)
      render json: {error: "That plant already belongs to that plot"}
    elsif @plot.user_id == @current_user.id
      @plot.plants << @plant
      render 'users/show'
    else
      render json: {error: "You're not authorized to complete this action"}, status: :unauthorized
    end
  end

  private
    def plant_params
      params.require(:plant).permit(:umn_plantID, :common_name, :scientific_name, :height, :spread, :form, :seasonal_interest, :seasonal_interest_specific, :flower_color, :landscape_use, :light, :zone, :soil, :notes, :cultivar_group, :vitamins, :maturity, :spring_start_relative_last_frost, :transplant_spring_start_relative_last_frost, :fall_start_relative_first_frost, :transplant_fall_relative_first_frost)
    end

    def plot_params
      params.permit(:plot, :name, :user_id)
    end

    def has_plot
      if @current_user.plots.empty?
        @plot = Plot.new(:name => "My First Plot")
        @current_user.plots << @plot
      end
    end

end
