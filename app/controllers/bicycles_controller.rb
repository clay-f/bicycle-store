class BicyclesController < ApplicationController
  def index
  end

  def new
    @bicycle = Bicycle.new
    @categories = Category.all
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    if @bicycle.save
      redirect_to bicycle_path(@bicycle)
    else
      logger.debug "catch create error"
      render "new"
    end
  end

  def edit
  end

  def update
    
  end

  def destroy
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:name, :info, :price)
  end
end
