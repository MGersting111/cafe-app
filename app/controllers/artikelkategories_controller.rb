class ArtikelkategoriesController < ApplicationController
  before_action :set_artikelkategory, only: %i[ show edit update destroy artikels]

  def index
    @artikelkategories = Artikelkategorie.all
  end

  def show
  end

  def new
    @artikelkategorie = Artikelkategorie.new
  end

  def edit
  end

  def artikels
    @artikels = @artikelkategorie.artikels
  end

  def create
    @artikelkategorie = Artikelkategorie.new(artikelkategory_params)
    if @artikelkategorie.save
      redirect_to artikelkategory_url(@artikelkategorie), notice: "Die Artikelkategoire wurde erfolgreich hinzugefügt."
    else
      render :new
    end
  end

  def update
    if @artikelkategorie.update(artikelkategory_params)
      redirect_to artikelkategory_url(@artikelkategorie), notice: "Die Artikelkategorie wurde erfolgreich geändert."
    else
      render :edit
    end
  end

  def destroy
    @artikelkategorie.destroy
    redirect_to artikelkategories_url, notice: "Die Artikelkategorie wurde erfolgreich gelöscht."
  end

  private

    def set_artikelkategory
      @artikelkategorie = Artikelkategorie.find(params[:id])
    end

    def artikelkategory_params
      params.require(:artikelkategorie).permit(:kategorie)
    end
end
