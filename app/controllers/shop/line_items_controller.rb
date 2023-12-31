# frozen_string_literal: true

module Shop
  class LineItemsController < BaseController
    before_action :set_line_item, only: %i[update destroy]

    def create
      @line_item = find_or_build_line_item

      @line_item.count += line_create_params[:count].to_i
      @line_item.save!

      redirect_to shop_category_articles_path(@line_item.article.category),
                  success: "#{@line_item.article.name} wurde erfolgreich hinzugefügt."
    end

    def update
      if @line_item.update(line_update_params)
        redirect_to shop_basket_path, notice: 'Die Anzahl wurde erfolgreich geändert.'
      else
        render :edit
      end
    end

    def destroy
      @line_item.destroy
      redirect_to shop_basket_path, notice: 'Der Artikel wurde erfolgreich aus dem Warenkorb entfernt!'
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

    def find_or_build_line_item
      line_item = @current_order.line_items.find_by(article_id: line_create_params[:article_id])
      return line_item if line_item

      line_item = @current_order.line_items.build(line_create_params.except(:count))
      line_item.company = current_company
      line_item
    end
  end
end
