class Category < ApplicationRecord
  has_many :dresses, dependent: :destroy
end
