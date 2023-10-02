# frozen_string_literal: true


class ArticlesController < ApplicationController
  before_action :set_category
  before_action :set_article, only: %i[show]

  def index
    @articles = @category.article
  end

  def show; end


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
