class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: { unique: false }, foreign_key: true

      t.timestamps
    end
  end
end
