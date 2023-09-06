class WarenkorbsController < ApplicationController
	def index
		@bestellungen = Bestellung.all
		@bestellung_artikel = BestellungArtikel.all
	end
end