# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[update]

  def order_complete
    if @current_order.empty?
      redirect_to categories_path, notice: 'Fehler: Keine Artikel im Warenkorb'
    elsif !@current_order.update(state: 'placed')
      redirect_to categories_path, notice: 'Fehler: Bestellung konnte nicht aufgegeben werden'
    else
      spawn_new_current_order
      redirect_to categories_path, notice: 'Bestellung wurde abgeschlossen'
    end
  end

  def update
    table_id = order_params.delete(:table_id)
    table = Table.find_by(id: table_id)
    update_params = order_params.merge(table: table)

    if @order.update(update_params)
      redirect_to basket_path
    else
      render :edit
    end
  end

  private
  def set_order
      @order = Order.find(params[:id])
  end

  def order_params
      params.require(:order).permit(:table_id)
  end
end
