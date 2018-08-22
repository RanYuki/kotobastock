require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  test "source save" do
  	source = Source.new({
  	author_id: '1',
  	sentence_id: '1',
  	title: 'サガンという生き方',
  	kana: 'サガントイウイキカタ'
  	})
  assert source.save, 'Failed to save'
  end
end
