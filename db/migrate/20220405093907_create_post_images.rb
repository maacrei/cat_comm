class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.integer :customer_id
      t.string :title
      t.text :caption

      t.timestamps
    end
  end
end
