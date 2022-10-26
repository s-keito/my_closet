class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :dress
  validates :comment, presence: true, length: { in: 1..20 }
end
