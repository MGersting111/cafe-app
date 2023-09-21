# frozen_string_literal: true

class RemoveOrdersGrandTotal < ActiveRecord::Migration[7.0]
  def up
    remove_column :orders, :grand_total
  end

  def down
    add_column :orders, :grand_total, :integer
    execute <<-RAW_SQL
      UPDATE
        orders
      SET
        grand_total = (
          SELECT sum(articles.price * line_items.count)
          FROM line_items JOIN articles ON (line_items.article_id = articles.id)
          WHERE line_items.order_id = orders.id
          GROUP BY orders.id
        )
    RAW_SQL
  end
end
