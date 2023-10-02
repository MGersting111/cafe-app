# frozen_string_literal: true

module Management
  class ArticlesController < BaseController
    before_action :set_category
    before_action :set_article, only: %i[show edit update destroy add]

    def index
      @articles = @category.article
    end

    def show; end

    def new
      @article = Article.new(category: @category)
    end

    def edit; end

    def create
      @article = @category.article.build(article_params)

      if @article.save
        redirect_to management_category_articles_url(@category), notice: 'Artikel wurde erfolgreich erstellt.'
      else
        render :new
      end
    end

    def update
      if @article.update(article_params)
        redirect_to management_category_article_url(@category, @article), notice: 'Artikel wurde erfolgreich geändert.'
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to management_category_articles_url, notice: 'Artikel wurde erfolgreich gelöscht.'
    end

    def add; end

    private

    def set_category
      if params[:category_id]
        @category = Category.find(params[:category_id])
      elsif params.dig(:article, :category_id)
        @category = Category.find(params.dig(:article, :category_id))
      else
        @arikelkategorie = nil
      end
    end

    def set_article
      @article = @category.article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:name, :category_id, :price)
    end
  end
end
