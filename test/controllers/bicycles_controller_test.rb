require 'test_helper'

class BicyclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bicycle = bicycles(:one)
    @update = {name: "qux", info: "qux", price: 10, category_id: categories(:one).id}
  end

  test "should get index" do
    get bicycles_url
    assert_response :success
  end

  test "should get new" do
    get new_bicycle_url
    assert_response :success
  end

  test "should create bicycle"  do
    assert_difference('Bicycle.count') do
      post bicycles_path, params: {bicycle: @update}
    end
    assert_redirected_to bicycle_url(Bicycle.last)
  end

  test "should show bicycle" do
    get bicycle_url(@bicycle)
    assert_response :success
  end

  test "should update bicycle" do
    patch bicycle_url(@bicycle), params: {bicycle: @update}
    assert_redirected_to bicycle_url(@bicycle)
  end

  test "should delete bicycle" do
    assert_difference('Bicycle.count', -1) do
      delete bicycle_url(bicycles(:one))
    end

    assert_redirected_to bicycles_url
  end
end
