class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.belongs_to :category, index: { unique: true }, foreign_key: true
      t.belongs_to :brand

      t.string :name
      t.integer :unit_price
      t.timestamps
    end
  end
end
