# frozen_string_literal: true

class Table < ApplicationRecord
  has_many :orders
end
