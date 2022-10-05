class Dress < ApplicationRecord
  belongs_to :user
  belongs_to :season
  has_many :dress_seasons, dependent: :destroy
  has_many :favorites, dependent: :destroy
  enum category: {tops: 0, bottoms: 1, shoes: 2, accessories: 3 }
  has_one_attached :image
  validates :image, presence: true
  validates :caption, presence: true, length: { in: 1..40 }
  validates :category, presence: true

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
