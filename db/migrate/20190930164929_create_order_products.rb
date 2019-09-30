class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.belongs_to :order, index: { unique: true }, foreign_key: true
      t.belongs_to :product, index: { unique: true }, foreign_key: true

      t.integer :amount
      t.string :description
      t.integer :processing_time
      t.timestamps
    end
  end
end
