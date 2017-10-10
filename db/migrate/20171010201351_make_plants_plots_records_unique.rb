class MakePlantsPlotsRecordsUnique < ActiveRecord::Migration[5.1]
  def change
    remove_index :plants_plots, [:plot_id, :plant_id]
    add_index :plants_plots, [:plot_id, :plant_id], unique: true
  end
end
