class RemovePlantFromPlot < ActiveRecord::Migration[5.1]
  def change
    remove_column :plots, :plant_id
  end
end
