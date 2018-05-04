class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def activity
  end
  
  def index
    @carousel_products = Product.order(Arel.sql('random()')).limit(5)
    @products = Product.order(Arel.sql('random()')).limit(3)
    @categories = Category.all
    @new_products = Product.order(:created_at).limit(8)
  end
end
