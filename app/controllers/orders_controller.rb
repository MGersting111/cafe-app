class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  def current_order
  end

  def grand_total
    self.line_items.map{ |i|
      i.anzahl
    }.sum
  end

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
    if @order.update(order_params)
      redirect_to order_url(@order), notice: "Order was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: "Order was successfully destroyed."
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:table, :gesamtpreis)
    end
end
