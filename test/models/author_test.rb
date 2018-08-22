require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "author save" do
  	author = Author.new({
  		name: 'フランソワーズ・サガン',
  		kana: 'フランソワーズ・サガン'
  		})
  	assert author.save, 'Failed to save'
  end
end
