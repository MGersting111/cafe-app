class ArtikelkategoriesController < ApplicationController
  before_action :set_artikelkategory, only: %i[ show edit update destroy ]

  # GET /artikelkategories or /artikelkategories.json
  def index
    @artikelkategories = Artikelkategorie.all
  end

  # GET /artikelkategories/1 or /artikelkategories/1.json
  def show
  end

  # GET /artikelkategories/new
  def new
    @artikelkategory = Artikelkategorie.new
  end

  # GET /artikelkategories/1/edit
  def edit
  end

  # POST /artikelkategories or /artikelkategories.json
  def create
    @artikelkategory = Artikelkategorie.new(artikelkategory_params)

    respond_to do |format|
      if @artikelkategory.save
        format.html { redirect_to artikelkategory_url(@artikelkategory), notice: "Artikelkategorie was successfully created." }
        format.json { render :show, status: :created, location: @artikelkategory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artikelkategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artikelkategories/1 or /artikelkategories/1.json
  def update
    respond_to do |format|
      if @artikelkategory.update(artikelkategory_params)
        format.html { redirect_to artikelkategory_url(@artikelkategory), notice: "Artikelkategorie was successfully updated." }
        format.json { render :show, status: :ok, location: @artikelkategory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artikelkategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artikelkategories/1 or /artikelkategories/1.json
  def destroy
    @artikelkategory.destroy

    respond_to do |format|
      format.html { redirect_to artikelkategories_url, notice: "Artikelkategorie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artikelkategory
      @artikelkategory = Artikelkategorie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artikelkategory_params
      params.require(:artikelkategory).permit(:kategorie)
    end
end
