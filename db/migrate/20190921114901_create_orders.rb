class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.integer :order_no
      t.string :order_type
      t.integer :price
      t.string :instructions
      t.time :processing_time
      t.timestamps
    end
  end
end
