# frozen_string_literal: true

class AddSuperAdmin < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :super_admin, :boolean, null: false, default: false
  end
end
