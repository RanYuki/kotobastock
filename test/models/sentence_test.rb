require 'test_helper'

class SentenceTest < ActiveSupport::TestCase
  test 'sentence save' do
  	sentence = Sentence.new({
  		term_id: '1',
  		source_id: '1',
  		url: 'http://amzn.asia/aKjuL5Y',
  		body: 'サルトルは小説を書くだけでなく事件に参加することもできるほどの能力と頭脳のエネルギーをもっています。私にはそれがありません。',
  		favorite_count: '0'
  		})
  	assert sentence.save, 'Failed to save'
  end
end
