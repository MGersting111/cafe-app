
#Artikel.destroy_all
#Artikelkategorie.destroy_all



artikelkategorie = Artikelkategorie.create([{kategorie: "Snacks"}, {kategorie: "Kaltgetränke"}, {kategorie: "Heißgetränke"}])
artikel = Artikel.create([{name: "Brezel", artikelkategorie_id: 1, preis: 100}, {name: "Fanta", artikelkategorie_id: 2, preis: 150}])
