require 'test_helper'

class BicycleTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    bicycle = Bicycle.new
    assert bicycle.invalid?
    bicycle.name = "baz"
    assert bicycle.invalid?
    bicycle.info = "foo"
    assert bicycle.invalid?
    bicycle.price = 10
    bicycle.category_id = categories(:one).id
    bicycle.valid?
  end

  test "product price must be positive" do
    bicycle = bicycles(:one)
    bicycle.price = -1
    bicycle.invalid?
    assert_equal ["must be greater than or equal to 0.1"], bicycle.errors[:price]
    bicycle.price = 0
    bicycle.invalid?
    assert_equal ["must be greater than or equal to 0.1"], bicycle.errors[:price]
    bicycle.price = 1
    assert bicycle.valid?
  end
end