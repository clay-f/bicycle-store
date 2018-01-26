require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def new_product(image_url)
    Product.new(name: "foo", info: "foo", price: 1, avatar: image_url, category_id: categories(:one).id)
  end

  test "image url" do
    ok = %w{foo.gif foo.png FOO.JPG FOO.Jpg}
    bad =  %w{foo.doc foo.gif/more foo.gif.more}

    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid."
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end
end
