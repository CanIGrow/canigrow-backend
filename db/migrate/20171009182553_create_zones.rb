class CreateZones < ActiveRecord::Migration[5.1]
  def change
    create_table :zones do |t|
      t.integer  "zip"
      t.string   "zone"
      t.string   "temp_range"
      t.string   "concat"
      t.timestamps
    end
  end
end
