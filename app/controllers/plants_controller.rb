class PlantsController < ApplicationController
  def index
    @plants = Plant.all
    render :index
  end

  # GET /plants/1
  def show
    @plant = Plant.find(params[:id])
    render :show
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
    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:plant).permit(:umn_plantID, :common_name, :scientific_name, :height, :spread, :form, :seasonal_interest, :seasonal_interest_specific, :flower_color, :landscape_use, :light, :zone, :soil, :notes)
    end

end