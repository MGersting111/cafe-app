class CreateArtikels < ActiveRecord::Migration[7.0]
  def change
    create_table :artikels do |t|
      t.string :name
      t.integer :id_kategorie
      t.integer :preis

      t.timestamps
    end
  end
end
