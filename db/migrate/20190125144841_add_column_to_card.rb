# frozen_string_literal: true

class AddColumnToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :active, :boolean
    rename_column :cards, :discrounted_percentage, :discounted_percentage
    change_column :cards, :original_price, :decimal, precision: 12, scale: 2
  end
end
