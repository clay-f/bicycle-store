module CurrentCart
  private
  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue
    @cart = Cart.create(identify_id: (id = session.id || '123456'))
    session[:cart_id] = @cart.id
  end
end
