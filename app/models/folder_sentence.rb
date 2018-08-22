class FolderSentence < ApplicationRecord
  belongs_to :folder
  belongs_to :sentence
end
