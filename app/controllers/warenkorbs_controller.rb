class WarenkorbsController < ApplicationController
	def index
		@bestellungen = Bestellung.all
		@bestellung_artikel = BestellungArtikel.all
		@currentId = session[:id][2]
	end
end