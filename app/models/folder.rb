class Folder < ApplicationRecord
	belongs_to :user
	has_many :sentences, through: :folder_sentences
	has_many :folder_sentences
end
