# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :article_id
      t.integer :anzahl

      t.timestamps
    end
  end
end
