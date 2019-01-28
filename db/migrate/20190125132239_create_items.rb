# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, presence: true
      t.text :description
      t.boolean :has_discount, default: false
      t.decimal :original_price, precision: 12, scale: 2, presence: true
      t.integer :discounted_percentage
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
