require 'test_helper'

class ConceptTest < ActiveSupport::TestCase
  test "concept save" do
  	concept = Concept.new({
  		name: '自分の限界'
  	})
  	assert concept.save, 'Failed to save'
  end
end
