class Company < ApplicationRecord
  has_many: article
  has_many: category
  has_many: line_item
  has_many: order
  has_many: table
  has_many: user
end
