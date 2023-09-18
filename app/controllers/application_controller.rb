class ApplicationController < ActionController::Base
  before_action :discard_current_order
  before_action :setup_current_order

  private

  def discard_current_order
  	if params[:clear_order_id] == 't'
  	  session[:order_id] = nil
  	end
  end

  def setup_current_order
  	session[:order_id] ||= SecureRandom.uuid
  	@current_order = Order.find_or_create_by(order_id: session[:order_id])
  end

  def spawn_new_current_order
    session[:order_id] = nil
    setup_current_order
  end
end
