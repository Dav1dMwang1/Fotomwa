class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.belongs_to :brand, index: { unique: false }, foreign_key: true

      t.string :name
      t.integer :unit_price
      t.integer :processing_time
      t.integer :stock
      t.timestamps
    end
  end
end
