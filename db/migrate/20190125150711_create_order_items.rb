# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :item, foreign_key: true
      t.references :order, foreign_key: true
      t.decimal :unit_price, precision: 12, scale: 2
      t.integer :quantity
      t.decimal :total_price, precision: 12, scale: 2
      t.timestamps
    end
  end
end
