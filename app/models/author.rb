class Author < ApplicationRecord
	has_many :sources
	has_many :sentences, through: :sources
end
