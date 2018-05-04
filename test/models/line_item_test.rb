require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  test "should create line item" do
    cart = carts(:one)
    product = products(:one)
    assert_difference 'cart.line_items.size' do
      cart.line_items.create(product: product)
    end
  end
end
