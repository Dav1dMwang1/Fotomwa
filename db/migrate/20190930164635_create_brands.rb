class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.belongs_to :category, index: { unique: false }, foreign_key: true

      t.string :name
      t.integer :processing_time
      t.timestamps
    end
  end
end
