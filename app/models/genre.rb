class Genre < ApplicationRecord

  has_many :post_images

  # ジャンル名で検索して、そのジャンルの投稿を一覧表示する
  def self.search_for(content)
      PostImage.joins(:genre).where('name LIKE ?', '%' + content + '%')
  end

end
