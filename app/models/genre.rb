class Genre < ApplicationRecord

  has_many :post_images

  # ジャンル名で検索して、そのジャンルの投稿を一覧表示する
  def self.genre_name_like(content)
      PostImage.joins(:genre).where("name LIKE ?", "%" + content + "%")
  end

end
