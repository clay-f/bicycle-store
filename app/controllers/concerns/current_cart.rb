module CurrentCart
  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue
    @cart = Cart.create(identify_id: session.id)
    session[:cart_id] = @cart.id
  end
end
