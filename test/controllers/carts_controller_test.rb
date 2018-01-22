require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should create cart" do
    assert_difference('Cart.count') do
      post carts_url, params: { cart: {} }
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test "should destroy cart" do
    post line_items_url, params: {product_id: products(:foo).id}
    @cart = Cart.find(session[:cart_id])

    assert_difference('Cart.count', -1) do
      delete cart_url(@cart)
    end

    assert_redirected_to root_path
  end
end
