class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string   "umn_plantID"
      t.string   "type"
      t.string   "common_name"
      t.string   "scientific_name"
      t.string   "height"
      t.string   "spread"
      t.string   "form"
      t.string   "seasonal_interest"
      t.string   "seasonal_interest_specific"
      t.string   "flower_color"
      t.string   "landscape_use"
      t.string   "light"
      t.string   "zone"
      t.string   "soil"
      t.string   "notes"
      t.timestamps
    end
  end
end
