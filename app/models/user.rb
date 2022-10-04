class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dresses, dependent: :destroy
  has_one_attached :user_image
  validates :name, presence: true, length: { in: 1..20 }
  validates :introduction, length: { maximum: 40 }


  def get_user_image
    (user_image.attached?) ? user_image : 'no_image.jpg'
  end

  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
end
