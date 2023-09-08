
Artikel.destroy_all
Artikelkategorie.destroy_all
Bestellung.destroy_all
BestellungArtikel.destroy_all

artikel = Artikel.create([{name: "Brezel", artikelkategorie_id: 1, preis: 100}, {name: "Fanta", artikelkategorie_id: 2, preis: 150}])

artikelkategorie = Artikelkategorie.create([{kategorie: "Snacks"}, {kategorie: "Kaltgetränke"}, {kategorie: "Heißgetränke"}])

bestellung = Bestellung.create([{tischnummer: 1},{tischnummer: 2},{tischnummer: 2}])

bestellung_artikel = BestellungArtikel.create([{id_bestellung: 28, id_artikel: 2, anzahl: 4}, {id_bestellung: 29, id_artikel: 3, anzahl: 2}, {id_bestellung: 30, id_artikel: 1, anzahl: 1}])