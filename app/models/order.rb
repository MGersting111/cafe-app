class Order < ApplicationRecord
  ALLOWED_STATES = %w[ running placed served payed]
  has_many :line_items


  validates :state, 
            inclusion: { in: ALLOWED_STATES },
            presence: true

  def item_count
    @item_count ||= line_items.sum(:count)
  end

  def grand_total
    line_items.map{|li| li.total}.sum
  end
end
