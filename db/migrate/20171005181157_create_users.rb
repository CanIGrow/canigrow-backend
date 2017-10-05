class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.text :bio
      t.string :location
      t.string :api_token

      t.timestamps
    end
    add_index :users, :api_token, unique: true
  end
end
