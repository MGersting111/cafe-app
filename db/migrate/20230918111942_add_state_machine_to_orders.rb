# frozen_string_literal: true

class AddStateMachineToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :state, :string, default: 'running' # running/ placed / served / payed
  end
end
