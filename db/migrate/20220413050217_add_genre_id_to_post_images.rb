class AddGenreIdToPostImages < ActiveRecord::Migration[6.1]
  def change
    add_column :post_images, :genre_id, :integer
  end
end
