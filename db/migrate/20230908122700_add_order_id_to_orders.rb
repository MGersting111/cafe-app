class AddOrderIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :order_id, :string, null: false

    add_index :orders, :order_id
  end
end
