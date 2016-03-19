require 'test_helper'

class ReadMailerTest < ActionMailer::TestCase
  test "read_notification" do
    mail = ReadMailer.read_notification
    assert_equal "Read notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
