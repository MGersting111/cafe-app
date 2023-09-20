class AddStateMachineToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :state, :string, default: "running" #running/ placed / finished
  end
end
