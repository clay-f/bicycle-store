class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def index
    @carousel_products = Product.order("random()").limit(5)
    @products = Product.all
    @categories = Category.all
  end
end
