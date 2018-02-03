require 'test_helper'

class BuyProductTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  test "buy a product" do
    origin_product_count = Order.count
    tmp_product = products(:foo)

    get "/"
    assert_response :success

    post '/line_items', params: {product_id: tmp_product.id}, xhr: true
    assert_response :success

    cart = Cart.find(session[:cart_id])
    refute_nil cart
    assert_equal 1, cart.line_items.size
    assert_equal tmp_product, cart.line_items.first.product

    get "/orders/new"
    assert_response :success

    perform_enqueued_jobs do
      post "/orders", params: {
             order: {
               name: 'foo',
               address: 'foo',
               email: '839322915@qq.com',
               pay_type: "Check"
             }
           }
    end

    follow_redirect!

    assert_response :success
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size

    assert_equal origin_product_count + 1, Order.count
    order = Order.last

    assert_equal "foo", order.name
  end
end
