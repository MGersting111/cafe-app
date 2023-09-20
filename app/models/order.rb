class Order < ApplicationRecord
  has_many :line_items
  allowed_states = %w[ running placed served payed]
  validates :state, inclusion: allowed_states

  def item_count
    @item_count ||= line_items.sum(:count)
  end

  def grand_total
    line_items.map{|li| li.total}.sum
  end
end
