require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should create cart" do
    assert_difference('Cart.count') do
      post carts_url, params: { cart: {} }
    end

    assert_redirected_to cart_url(Cart.last)
  end
end
