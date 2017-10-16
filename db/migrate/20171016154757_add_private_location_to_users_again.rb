class AddPrivateLocationToUsersAgain < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :location_private, :boolean, default: false
  end
end
