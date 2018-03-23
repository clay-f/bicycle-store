module CurrentCart
  private

  def set_cart 
    @cart = Cart.find(session[:cart_id])
  rescue
    @cart = Cart.create(identify_id: session.id)
    session[:cart_id] = @cart.identify_id
    session[:expire_cart_at] = Time.current + 30.minutes
  end

  def authenticate_cart_expire_time
    if session[:expire_cart_at] < Time.current
      session[:cart_id] = nil
    end
  end
end
