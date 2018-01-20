module CartsHelper
  def create_cart
    unless session[:cart_id]
      cart = Cart.new
      session[:cart_id] = cart.id
    end
  end
end
