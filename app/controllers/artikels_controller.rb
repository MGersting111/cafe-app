class ArtikelsController < ApplicationController
  before_action :set_artikelkategorie
  before_action :set_artikel, only: [:show, :edit, :update, :destroy, :add]


  def index
    @artikels = @artikelkategorie.artikel
  end

  def show
  end

  def new
    @artikel = Artikel.new(artikelkategorie: @artikelkategorie)
  end

  def edit
  end

  def create
    @artikel = @artikelkategorie.artikel.build(artikel_params)

    if @artikel.save
      redirect_to artikelkategory_artikels_url(@artikelkategorie), notice: "Artikel wurde erfolgreich erstellt."
    else
      render :new
    end
  end

  def update
    if @artikel.update(artikel_params)
      redirect_to artikelkategory_artikel_url(@artikelkategorie, @artikel), notice: "Artikel wurde erfolgreich geändert."
    else
      render :edit
    end
  end

  def destroy
    @artikel.destroy
    redirect_to artikelkategory_artikels_url, notice: "Artikel wurde erfolgreich gelöscht."
  end

  def add
    if session[:id] 
      session[:id] << @artikel.id
    else
      session[:id] = [] 
    end
    redirect_to artikels_url
  end

  private

    def set_artikelkategorie
      if params[:artikelkategory_id]
        @artikelkategorie = Artikelkategorie.find(params[:artikelkategory_id])
      elsif params.dig(:artikel, :artikelkategorie_id)
        @artikelkategorie = Artikelkategorie.find(params.dig(:artikel, :artikelkategorie_id))
      else
        @arikelkategorie = nil
      end
    end

    def set_artikel
      @artikel = @artikelkategorie.artikel.find(params[:id])
    end

    def artikel_params
      params.require(:artikel).permit(:name, :artikelkategorie_id, :preis)
    end
end
