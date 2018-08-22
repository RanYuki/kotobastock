class Source < ApplicationRecord
	enum category: { movie:0, novel:1, comic:2, anime:3, drama:4, lyric:5, proverb:6, conversation:7
}
	belongs_to :sentence
	belongs_to :author
end
