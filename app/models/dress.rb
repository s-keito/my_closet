class Dress < ApplicationRecord
  belongs_to :user
  belongs_to :season
  belongs_to :category
  # has_many :season, through: :dress_seasons, dependent: :destroy
  # has_many :dress_seasons, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  #enum category: {tops: 0, bottoms: 1, shoes: 2, accessories: 3 }
  #enum is_status: { true: true, false: false }
  has_one_attached :image
  validates :image, presence: true
  validates :caption, presence: true, length: { in: 1..40 }
  validates :is_status, inclusion: [true, false]

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  
  def status_text
    (is_status == true) ? "公開": "非公開"
  end
      

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索方法分岐
  def self.looks(word)
    Dress.joins(:season, :category).where(['seasons.name LIKE ?', "%#{word}%"]).or(Dress.where('dresses.caption LIKE ?', "%#{word}%")).or(Dress.where(['categories.name LIKE ?', "%#{word}%"]))
  end
end
