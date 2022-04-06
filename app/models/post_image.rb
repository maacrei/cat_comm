class PostImage < ApplicationRecord

  belongs_to :customer

  has_one_attached :image

  validates :title, presence: true
  validates :caption, presence: true
  validates :image, presence: true

  # 投稿画像
  def get_image(width,height)
    image.variant(resize_to_limit: [width, height]).processed
  end

end
