# frozen_string_literal: true

class OrdersController < ApplicationController
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
end
