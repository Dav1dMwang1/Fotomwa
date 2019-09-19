class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid, limit: 50, null: false, default: ''
      t.string :provider, limit: 500, null: false, default: ''
      t.string :first_name
      t.string :last_name
      t.string :email, unique: true
      t.string :phone
      t.boolean :admin

      t.timestamps
    end
  end
end
