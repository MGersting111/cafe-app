class Artikel < ApplicationRecord
  #belongs_to :artikelkategorie
  has_many :bestellung_artikel
  has_many :bestellung, through: :bestellung_artikel
end
