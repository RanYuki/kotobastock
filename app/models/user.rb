class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :favorites, dependent: :destroy
  has_many :sentences, through: :favorites
  has_many :folders, dependent: :destroy
  has_many :sentences, through: :folder_sentences
  accepts_nested_attributes_for :folders

  # フォローする
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォローされる
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  # フォローしているユーザーを取得
  has_many :following, through: :active_relationships
  # フォロワーを取得
  has_many :followers, through: :passive_relationships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: { not_known:0, male:1, female:2, not_applicable:9 }
end
