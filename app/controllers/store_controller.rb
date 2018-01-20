class StoreController < ApplicationController
  def index
    @bicycles = Bicycle.all
  end
end
