# frozen_string_literal: true

class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :available
      t.integer :on_hold
      t.integer :sold
      t.integer :shipped
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
