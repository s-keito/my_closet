class Season < ApplicationRecord
  has_many :dress_seasons, dependent: :destroy
  has_many :dresses, through: :dress_seasons, dependent: :destroy
  validates :name, presence: true
end
