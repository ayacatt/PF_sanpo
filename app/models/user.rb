class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :relationships, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :follow

  def follow(user_id)
    relationships.create(user_id: user_id, follow_id: XXX)
  end
  def unfollow(user_id)

    relationships.find_by(follow_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image

end