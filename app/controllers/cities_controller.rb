class CitiesController < ApplicationController
  before_action :find_city, only: [:show, :edit, :destroy, :update]
  def index
    @cities = City.sorted
  end

  def show
    @architectures = @city.architectures.sort_by {|arc| arc.name}
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    @city.name = @city.name.titleize
    if @city.save
      redirect_to city_path(@city)
    else
      flash[:error] = @city.errors.full_messages
      redirect_to new_city_path
    end
  end

  def edit
  end

  def update
    @city.update(city_params)
    @city.name = @city.name.titleize    
    if @city.valid?
      redirect_to city_path(@city)
    else
      redirect_to edit_city_path
    end
  end

  def destroy
    @city.destroy
    redirect_to cities_path
  end

  private

  def find_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name)
  end

end
