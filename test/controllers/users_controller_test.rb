require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "shouldn't login" do
    post login_path, params: {user: {name: "foobar", password: "123456"}}
    assert_response :redirect
  end
end
