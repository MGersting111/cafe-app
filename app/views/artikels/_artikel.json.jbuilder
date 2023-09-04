json.extract! artikel, :id, :name, :id_kategorie, :preis, :created_at, :updated_at
json.url artikel_url(artikel, format: :json)
