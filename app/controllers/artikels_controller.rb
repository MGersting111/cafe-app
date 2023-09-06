class ArtikelsController < ApplicationController
  before_action :set_artikel, only: %i[ show edit update destroy ]

  # GET /artikels or /artikels.json
  def index
    @artikels = Artikel.all
  end

  # GET /artikels/1 or /artikels/1.json
  def show
  end

  # GET /artikels/new
  def new
    @artikel = Artikel.new
  end

  # GET /artikels/1/edit
  def edit
  end

  # POST /artikels or /artikels.json
  def create
    @artikel = Artikel.new(artikel_params)

    respond_to do |format|
      if @artikel.save
        format.html { redirect_to artikel_url(@artikel), notice: "Artikel was successfully created." }
        format.json { render :show, status: :created, location: @artikel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artikel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artikels/1 or /artikels/1.json
  def update
    respond_to do |format|
      if @artikel.update(artikel_params)
        format.html { redirect_to artikel_url(@artikel), notice: "Artikel was successfully updated." }
        format.json { render :show, status: :ok, location: @artikel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artikel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artikels/1 or /artikels/1.json
  def destroy
    @artikel.destroy

    respond_to do |format|
      format.html { redirect_to artikels_url, notice: "Artikel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artikel
      @artikel = Artikel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artikel_params
      params.require(:artikel).permit(:name, :id_kategorie, :preis)
    end
end
