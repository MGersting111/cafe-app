class CreateArtikelkategories < ActiveRecord::Migration[7.0]
  def change
    create_table :artikelkategories do |t|
      t.string :kategorie

      t.timestamps
    end
  end
end
