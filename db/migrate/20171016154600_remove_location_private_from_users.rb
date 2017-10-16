class RemoveLocationPrivateFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :location_private, :string
  end
end
