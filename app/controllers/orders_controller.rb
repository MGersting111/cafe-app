class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy order_payed order_served ]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_url(@order), notice: "Order was successfully created."
    else
      render :new
    end
  end

  def update
    table_id = order_params.delete(:table_id)
    table = table_id ? Table.find(table_id) : nil
    update_params = order_params.merge(table: table)

    if @order.update(update_params)
      redirect_to basket_path, notice: "Order was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: "Order was successfully destroyed."
  end

  def order_complete
    if @current_order.grand_total != 0
      #gesamtpreis wird in db gespeichert
      #state wird in placed geändert
      @current_order.update_column(:grand_total, @current_order.grand_total)
      @current_order.update_column(:state, "placed")
      spawn_new_current_order
      redirect_to categories_path, notice: "Bestellung wurde abgeschlossen"
    else
      redirect_to categories_path, notice: "Fehler: Keine Artikel im Warenkorb"
    end
  end

  def order_served
    @order.update(state: "served")
    redirect_to orders_url
  end

  def orders_served
    @orders = Order.all
  end

  def order_payed
    @order.update(state: "payed")
    redirect_to orders_url
  end

  def orders_payed
    @orders = Order.all
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:table_id)
    end
end
