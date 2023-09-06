class CreateBestellungs < ActiveRecord::Migration[7.0]
  def change
    create_table :bestellungs do |t|
      t.integer :tischnummer

      t.timestamps
    end
  end
end
