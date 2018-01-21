require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get store index" do
    get root_url
    assert_response :success
  end
end
