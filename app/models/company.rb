class Company < ApplicationRecord
  has_many :articles
  has_many :categories
  has_many :line_items
  has_many :orders
  has_many :tables
  has_many :users
end
