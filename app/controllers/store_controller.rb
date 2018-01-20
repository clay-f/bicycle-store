class StoreController < ApplicationController
  def index
    @products = Bicycle.all
  end
end
