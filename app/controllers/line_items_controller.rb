class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[ update destroy ]


  def create
    @line_item = @current_order.line_items.find_by(article_id: line_create_params[:article_id])
    @line_item = @current_order.line_items.build(line_create_params.except(:count)) if !@line_item
    @line_item.count += line_create_params[:count].to_i
    @line_item.save!

    redirect_to category_articles_path(@line_item.article.category)
  end

  def update
    if @line_item.update(line_update_params)
      redirect_to basket_path, notice: "Line item was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @line_item.destroy
    redirect_to line_items_url, notice: "Line item was successfully destroyed."
  end

  private

    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_create_params
      params.require(:line_item).permit(:article_id, :count)
    end

    def line_update_params
      params.require(:line_item).permit(:count)
    end
end
