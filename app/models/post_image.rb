class PostImage < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true, length: {maximum: 20}
  validates :caption, presence: true, length: {maximum: 200}

  # 投稿画像
  def get_image(width,height)
    image.variant(resize_to_limit: [width, height]).processed
  end

  # ユーザーIDがFavoritsテーブル内に存在するかどうかを調べる
  # 存在していればtrue,していなければfalseを返す
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # タイトル名で検索して、そのジャンルの投稿を一覧表示する
  def self.title_like(content)
    where("title LIKE ?", "%" + content + "%")
  end

end
