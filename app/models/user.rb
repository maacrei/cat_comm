class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  # ユーザー名は一意でないといけない
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true

  def self.guest
    find_or_create_by!(name: 'guestuser', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

end
