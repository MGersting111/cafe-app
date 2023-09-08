class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[ update destroy ]


  def create
    create_params = {order_id: @current_order.id}
    create_params = create_params.merge(line_item_params)
    @line_item = LineItem.create(create_params)
    redirect_to category_articles_path(@line_item.article.category)
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to line_item_url(@line_item), notice: "Line item was successfully updated."
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

    def line_item_params
      params.require(:line_item).permit(:order_id, :article_id, :anzahl)
    end
end
