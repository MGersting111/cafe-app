class AddCompanyId < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :company_id, :integer
    add_column :categories, :company_id, :integer
    add_column :articles, :company_id, :integer
    add_column :line_items, :company_id, :integer
    add_column :orders, :company_id, :integer
    add_column :tables, :company_id, :integer
  end
end
