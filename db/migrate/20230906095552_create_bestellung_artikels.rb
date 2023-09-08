class CreateBestellungArtikels < ActiveRecord::Migration[7.0]
  def change
    create_table :bestellung_artikels do |t|
      t.integer :id_bestellung
      t.integer :id_artikel
      t.integer :anzahl

      t.timestamps
    end
  end
end
