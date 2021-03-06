class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show, :destroy]
  before_action :authenticate_cart_expire_time
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def show
    unless @cart.identify_id == session.id
      redirect_to root_url
    end
  end

  def create
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was created' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart.destroy if @cart.identify_id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:identify_id)
  end

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_url, notice: 'Invalid cart'
  end
end
