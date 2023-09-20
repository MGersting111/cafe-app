class AddTableName < ActiveRecord::Migration[7.0]
  def up
    add_column :tables, :name, :string, null: false, default: ""
    execute 'update tables set name = id;'
  end

  def down
    remove_column :tables, :name
  end
end
