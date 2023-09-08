class CategoryController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy articles]

  def index
    @categorys = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def articles
    @articles = @category.articles
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_url(@category), notice: "Die Artikelkategoire wurde erfolgreich hinzugefügt."
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to category_url(@category), notice: "Die Artikelkategorie wurde erfolgreich geändert."
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categorys_url, notice: "Die Artikelkategorie wurde erfolgreich gelöscht."
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end