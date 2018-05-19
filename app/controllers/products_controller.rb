class ProductsController < ApplicationController
  include AuthenticateUser
  before_action :authorized, except: [:show, :suggestion_product]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_product

  def suggestion_product
    list = Product.order(Arel.sql('random()')).limit(6)
    respond_to do |format|
      format.json { render json: list }
    end
  end

  def index
    @products = Product.all
  end

  def show
    @guess_products = Product.order(Arel.sql('random()')).limit(6)
  end

  def new
    @product = Product.new
    @categories = Category.all.map { |i| [i.name, i.id] }
  end

  def edit
    @categories = Category.all.map { |i| [i.name, i.id] }
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :info, :price, :category_id, {desc_images: []}, :avatar)
    end

    def invalid_product
        redirect_to products_url
    end
end
