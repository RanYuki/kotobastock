class Term < ApplicationRecord
	has_many :sentences, :dependent => :nullify
end
