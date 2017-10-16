class AddPrivateLocationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :location_private, :string
  end
end
