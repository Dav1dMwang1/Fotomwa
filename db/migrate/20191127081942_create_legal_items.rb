class CreateLegalItems < ActiveRecord::Migration[5.2]
  def change
    create_table :legal_items do |t|
      t.string :content

      t.timestamps
    end
  end
end
