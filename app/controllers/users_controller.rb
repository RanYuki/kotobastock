class UsersController < ApplicationController

	def top
	end

	def mypage
	end

	def edit_name
	end

	def edit_email
	end
	#ユーザーをフォローする
	def follow(other_user)
		active_relationships.create(following_id: other_user.id)
	end

	#ユーザーをアンフォローする
	def unfollow(other_user)
		active_relationships.find_by(following_id: other_user.id).destroy
	end

	#現在のユーザーがフォローしていたらtrueを返す
	def following?(other_user)
		following.include?(other_user)
	end
end
