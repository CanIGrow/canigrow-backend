class RemoveZoneTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :zones
  end
end
