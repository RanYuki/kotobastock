class Relationship < ApplicationRecord
	#フォローする
	belongs_to :follower, class_name: "User"
	#フォローされる
	belongs_to :following, class_name: "User"
end
