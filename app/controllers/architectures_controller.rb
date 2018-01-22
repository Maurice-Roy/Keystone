class ArchitecturesController < ApplicationController
  before_action :find_architecture, only: [:show, :edit, :destroy, :update]
  def index
    @architectures = Architecture.all
  end

  def show
  end

  def new
    @artists = Artist.all
    @cities = City.all
    @architecture = Architecture.new
  end

  def create
    @architecture = Architecture.new(architecture_params)
    if @architecture.save
      redirect_to architecture_path(@architecture)
    else
      flash[:error] = @architecture.errors.full_messages
      redirect_to new_architecture_path
    end
  end

  def edit
    @artists = Artist.all
    @cities = City.all
  end

  def update
    @architecture.update(architecture_params)
    if @architecture.valid?
      redirect_to architecture_path(@architecture)
    else
      redirect_to edit_architecture_path
    end
  end

  def destroy
    @architecture.destroy
    redirect_to architectures_path
  end

  private

  def find_architecture
    @architecture = Architecture.find(params[:id])
  end

  def architecture_params
    params.require(:architecture).permit(:name, :year_created, :city_id, :artist_id)
  end

end
