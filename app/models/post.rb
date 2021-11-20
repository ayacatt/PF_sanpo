class Post < ApplicationRecord

  belongs_to :user
  attachment :image
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_one :spot, dependent: :destroy
  accepts_nested_attributes_for :spot

  def self.search(genre_id)
    #where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
    where(genre_id: genre_id)
  end

end
