class RemoveCustomerIdFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :customer_id, :integer
  end
end
