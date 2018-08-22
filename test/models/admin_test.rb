require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test "admin save" do |variable|
  	admin = Admin.new({
  		email: 'morning@wakeup.jp',
  		encrypted_password: '11111111'
  		})
  	assert admin.save, 'Failed to save'
  end
end
