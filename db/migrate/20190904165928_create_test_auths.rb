class CreateTestAuths < ActiveRecord::Migration[5.2]
  def change
    create_table :test_auths do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :picture

      t.timestamps
    end
  end
end
