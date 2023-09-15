class Order < ApplicationRecord
  has_many :line_items

  def item_count
    @item_count ||= line_items.sum(:count)
  end

  def grand_total
    line_items.map{|li| li.total}.sum
  end
end
