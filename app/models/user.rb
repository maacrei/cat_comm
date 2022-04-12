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

  # ゲストユーザーの名前とメールアドレスとパスワードは自動作成
  def self.guest
    find_or_create_by!(name: 'guestuser', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  # 投稿ユーザー名で検索して、そのユーザーの投稿を一覧表示する
  def self.search_for(content)
    PostImage.joins(:user).where('name LIKE ?', '%' + content + '%')
  end

end
