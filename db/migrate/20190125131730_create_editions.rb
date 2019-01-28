# frozen_string_literal: true

class CreateEditions < ActiveRecord::Migration[5.2]
  def change
    create_table :editions do |t|
      t.string :name
      t.datetime :release_date
      t.timestamps
    end
  end
end
