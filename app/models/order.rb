# frozen_string_literal: true

class Order < ApplicationRecord
  ALLOWED_STATES = %w[running placed served payed].freeze
  has_many :line_items
  belongs_to :table, optional: true
  belongs_to :company

  validates :state,
            inclusion: { in: ALLOWED_STATES },
            presence: true

  def item_count
    @item_count ||= line_items.sum(:count)
  end

  def grand_total
    line_items.map(&:total).sum
  end

  def empty?
    line_items.none?
  end
end
