# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 12, scale: 2
      t.decimal :tax, precision: 12, scale: 2
      t.decimal :shipping, precision: 12, scale: 2
      t.decimal :total, precision: 12, scale: 2
      t.references :order_status, foreign_key: true
      t.timestamps
    end
  end
end
