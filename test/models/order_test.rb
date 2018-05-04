require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "should create order" do
    order = Order.create(name: "order one", address: "some else", email: "foo@foo.com", pay_type: 1)
    assert order
  end
end
