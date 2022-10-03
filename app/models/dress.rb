class Dress < ApplicationRecord
  belongs_to :user
  enum category: {tops: 0, bottoms: 1, shoes: 2, accessories: 3 }
  has_one_attached :image
end
