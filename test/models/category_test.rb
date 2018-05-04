require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "get categories" do
    assert Category.all.size > 0
  end
end
