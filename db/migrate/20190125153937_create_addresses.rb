# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street_name_1
      t.string :street_name_2
      t.string :city
      t.integer :postal_code
      t.string :country
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
