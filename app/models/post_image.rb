class PostImage < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true
  validates :caption, presence: true
  validates :image, presence: true

  # 投稿画像
  def get_image(width,height)
    image.variant(resize_to_limit: [width, height]).processed
  end

  # ユーザーIDがFavoritsテーブル内に存在するかどうかを調べる
  # 存在していればtrue,していなければfalseを返す
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


end
