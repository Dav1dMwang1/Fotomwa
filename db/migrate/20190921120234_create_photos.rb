class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.belongs_to :order
      t.string :photo_type
      t.string :photo_size
      t.timestamps
    end
  end
end
