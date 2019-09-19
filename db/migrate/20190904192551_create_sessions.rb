class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :session_id, null: false, unique: true
      t.text :data
      t.timestamps
    end
    add_index :sessions, :updated_at
  end
end
