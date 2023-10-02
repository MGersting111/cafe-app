# frozen_string_literal: true


class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show articles]

  def index
    @categories = Category.all
  end

  def show; end

  def articles
    @articles = @category.articles
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end

