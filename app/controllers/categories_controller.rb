class CategoriesController < ApplicationController
  include AuthenticateUser
  before_action :authorized, except: [:index]
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
    if params.fetch(:category_id, false)
      @category_img = "category_#{params[:category_id]}.jpg"
      @products = Product.where(category_id: params[:category_id])
    else
      @category_img = "category_1.jpg"
      @products = Product.where(category_id: 1).limit(4)
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update

    if @category.update(category_params)
      redirect_to category_path
    else
      render "edit"
    end
  end

  def destroy

    @category.destroy
    redirect_to categories_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :avatar)
  end
end
