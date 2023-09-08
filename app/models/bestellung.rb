class Bestellung < ApplicationRecord
	has_many :bestellung_artikel
	has_many :artikel, through: :bestellung_artikel
end
