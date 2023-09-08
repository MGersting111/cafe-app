class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :table
      t.integer :gesamtpreis

      t.timestamps
    end
  end
end
