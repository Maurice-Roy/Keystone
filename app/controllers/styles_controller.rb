class StylesController < ApplicationController
  before_action :find_style, only: [:show, :edit, :destroy, :update]
  def index
    @styles = Style.sorted
  end

  def show
    @architectures = @style.architectures.sort_by {|arc| arc.name}
  end

  def new
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    if @style.save
      redirect_to style_path(@style)
    else
      flash[:error] = @style.errors.full_messages
      redirect_to new_style_path
    end
  end

  def edit
  end

  def update
    @style.update(style_params)
    if @style.valid?
      redirect_to style_path(@style)
    else
      redirect_to edit_style_path
    end
  end

  def destroy
    @style.destroy
    redirect_to styles_path
  end

  private

  def find_style
    @style = Style.find(params[:id])
  end

  def style_params
    params.require(:style).permit(:name)
  end

end
