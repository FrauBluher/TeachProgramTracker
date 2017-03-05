class ResidencyLocationsController < ApplicationController
  def index
    @residency_locations = ResidencyLocation.all
  end

  def new
    @residency_location = ResidencyLocation.new
  end

  def create
    @residency_location = ResidencyLocation.new(residency_location_params)
    if @residency_location.save
      redirect_to residency_locations_path
    else
      render :new
    end
  end

  def residency_location_params
    params.require(:residency_location).permit(:name)
  end
end
