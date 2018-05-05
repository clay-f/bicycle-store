require 'test_helper'

class VendorChangeProductTest < ActionDispatch::IntegrationTest
  test "vendor should create product" do
    visit('/login')
    fill_in('user[name]', with: "foo")
    fill_in('user[password]', with: "123456")
    click_on('login')
    find_link('Logout', visible: :all).visible?
    assert page.status_code == 200
    visit('/products')
    assert page.status_code == 200
    assert page.has_content?('Products')
    within("table tbody tr:nth-child(1)") do
      find_link('Show')
      click_on('Show')
    end
    page.status_code == '200'
    page.has_content?('iFun516')
    page.has_content?('$910.00')
    click_on('编辑')
    assert page.status_code == 200
    within("form") do
      fill_in("product[name]", with: "iFun?")
      click_on('Update Product')
    end
    assert page.status_code == 200
    assert page.has_content?('iFun?')
  end
end
