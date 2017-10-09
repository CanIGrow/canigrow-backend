class ZonesController < ApplicationController
  def get_zone
    @zone = Zone.find_by(zip: params[:zip])
    render :show
  end

  private
  def zone_params
    params.require(:zone).permit(:zip, :zone, :temp_range, :concat)
  end
end
