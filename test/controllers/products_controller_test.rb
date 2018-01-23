require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @update = {name: "foo", info: "foo", price: 1, category_id: categories(:one).id}
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :redirect
  end

  test "should create product" do
    assert_no_difference('Product.count', -1) do
      post products_url, params: { product: @update }
    end

    assert_redirected_to root_url
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :redirect
  end

  test "should update product" do
    patch product_url(@product), params: { product: @update }
    assert_redirected_to root_url
  end

  test "should destroy product" do
    assert_no_difference 'Product.count' do
      delete product_path(Product.last)
    end

    assert_redirected_to root_url
  end
end
