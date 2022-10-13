class Season < ApplicationRecord
  has_many :dress_seasons, dependent: :destroy
  # has_many :dresses, through: :dress_seasons, dependent: :destroy
  # has_many :dresses, dependent: :destroy
  has_many :dresses
  validates :name, presence: true
end
