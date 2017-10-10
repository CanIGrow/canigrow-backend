class DropZoneTable < ActiveRecord::Migration[5.1]
  def down
    drop_table :zones
  end
end
