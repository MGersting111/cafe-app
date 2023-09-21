# frozen_string_literal: true

class ChangeTableFk < ActiveRecord::Migration[7.0]
  def up
    add_column :orders, :table_id, :integer
    execute 'update orders set table_id = "orders"."table";'
    remove_column :orders, :table
  end

  def down
    add_column :orders, :table, :integer
    execute 'update orders set "orders"."table" = table_id'
    remove_column :orders, :table_id
  end
end
