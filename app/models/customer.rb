class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :post_images
  
  # ユーザー名は一意でないといけない
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  
end
