# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

artikel = Artikel.create([{name: "Brezel", artikelkategorie_id: 1, preis: 100}, {name: "Fanta", artikelkategorie_id: 2, preis: 150}])

artikelkategorie = Artikelkategorie.create([{kategorie: "Snacks"}, {kategorie: "Kaltgetränke"}, {kategorie: "Heißgetränke"}])
