require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user save" do
  	user = User.new({
  		email: 'sagan@sag.com',
  		encrypted_password: '11111111',
  		name: 'フランソワーズ・サガン',
  		gender: '2',
  		profile: 'Bonjour Tristesse',
  		picture: 'nil'
      favorite_count: '0'
  		})
    assert user.save, 'Failed to save'
  end
end
