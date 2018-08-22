require 'test_helper'

class TermTest < ActiveSupport::TestCase
  test "term save" do
  	term = Term.new({
  		name: '能力',
  		kana: 'ノウリョク'
  		})
  	assert term.save, 'Failed to save'
  end
end
