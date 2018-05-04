module CurrentCart
  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue
    session[:set_cart_need_load_session] = false
    @cart = Cart.create(identify_id: session.id)
    session[:cart_id] = @cart.id
    session[:expire_cart_at] = Time.current + 30.minutes
  end

  def authenticate_cart_expire_time
    if session[:expire_cart_at] < Time.current
      session[:cart_id] = nil
    end
  end
end
