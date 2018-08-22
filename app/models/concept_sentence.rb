class ConceptSentence < ApplicationRecord
  belongs_to :concept
  belongs_to :sentence
end
