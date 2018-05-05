require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should get user" do
    refute_nil User.first
  end

  test "should create user" do
    u = User.create(name: "foo", password: "123456")
    refute_nil u
    assert User.all.size > 3
  end
end
