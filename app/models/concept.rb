class Concept < ApplicationRecord
	has_many :sentences, through: :concept_sentences
	has_many :concept_sentences, dependent: :destroy
end
