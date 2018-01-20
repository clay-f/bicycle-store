class StoreController < ApplicationController
  def index
    @bicycles = Product.all
  end
end
