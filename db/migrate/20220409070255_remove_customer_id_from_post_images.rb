class RemoveCustomerIdFromPostImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_images, :customer_id, :integer
  end
end
