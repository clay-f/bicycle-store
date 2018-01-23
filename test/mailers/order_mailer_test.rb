require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "bicycle store confirmation", mail.subject
    assert_equal ["f@f.com"], mail.to
    assert_equal ["liyongfeit@163.com"], mail.from
    assert_match "foo", mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "bicycle store shipped", mail.subject
    assert_equal ["f@f.com"], mail.to
    assert_equal ["liyongfeit@163.com"], mail.from
  end

end