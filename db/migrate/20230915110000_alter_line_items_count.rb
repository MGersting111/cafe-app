# frozen_string_literal: true

class AlterLineItemsCount < ActiveRecord::Migration[7.0]
  def change
    rename_column :line_items, :anzahl, :count
    change_column_default :line_items, :count, from: nil, to: 0
  end
end
