require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should get user" do
    refute_nil User.first
  end
end
