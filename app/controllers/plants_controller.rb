class PlantsController < ApplicationController
  before_action :authenticate, only: [:update, :favorite, :destroy]
  before_action :current_user, only: [:favorite, :update, :destroy]
  before_action :has_plot, only: [:favorite]

  def index
    @plants = Plant.all
    render :index
  end

  # GET /plants/1
  def show
    @plant = Plant.find(params[:id])
    render :show
  end

  def favorite
    @plant = Plant.find(params[:plant_id])
    @plot = Plot.find_by(id: params[:id]) || @current_user.plots.first
    @plot.plants << @plant
    render 'users/show'
  end

  # PATCH/PUT /plants/1
  def update
    if @plant.update(plant_params)
      render json: @plant
    else
      render json: @plant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plants/1
  def destroy
      @plant.destroy
  end

  private
    def plant_params
      params.require(:plant).permit(:umn_plantID, :common_name, :scientific_name, :height, :spread, :form, :seasonal_interest, :seasonal_interest_specific, :flower_color, :landscape_use, :light, :zone, :soil, :notes)
    end

    def has_plot
      if @current_user.plots.empty?
        @plot = Plot.new(:name => "My First Plot")
        @current_user.plots << @plot
      end
    end

end
