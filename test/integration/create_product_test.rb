require 'test_helper'

class CreateProductTest < ActionDispatch::IntegrationTest
  test "should create product" do
    origin_product_size = Product.all.size
    visit("/login")
    within("form") do
      fill_in("user[name]", with: "foo")
      fill_in("user[password]", with: "123456")
      click_on("login")
    end
    assert page.status_code == 200
    visit("/products/new")
    assert page.status_code == 200
    within("form") do
      fill_in("product[name]", with: "some product")
      fill_in("product[avatar]", with: "a.png")
      fill_in("product[info]", with: "product description")
      fill_in("product[price]", with: 100)
      click_on('Create Product')
    end
    assert origin_product_size < Product.all.size
    visit("/products")
    assert page.has_content?('some product')
  end
end
