class BicyclesController < ApplicationController
  before_action :find_bicycle, only: [:show, :edit, :update, :destroy]

  def index
    @bicycles = Bicycle.all
  end

  def new
    @bicycle = Bicycle.new
    @categories = Category.all.map { |i| [i.name, i.id] }
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    @categories = Category.all.map { |i| [i.name, i.id] }

    if @bicycle.save
      redirect_to bicycle_path(@bicycle)
    else
      logger.debug "catch create error"
      render "new"
    end
  end

  def show
  end

  def edit
    @categories = Category.all.map { |i| [i.name, i.id] }
  end

  def update
    @bicycle.update(bicycle_params)
    redirect_to bicycle_path(@bicycle)
  end

  def destroy
    @bicycle.destroy
    redirect_to bicycles_path
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:name, :info, :price, :category_id)
  end

  def find_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
end
