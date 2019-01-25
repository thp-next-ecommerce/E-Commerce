class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :color
      t.string :rarity
      t.text :text
      t.string :type
      t.boolean :premium
      t.boolean :has_discount
      t.float :original_price
      t.integer :discrounted_percentage
      t.references :edition, foreign_key: true

      t.timestamps
    end
  end
end
