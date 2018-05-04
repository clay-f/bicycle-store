require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "should get cart" do
    cart = carts(:one)
    assert cart
  end
end
