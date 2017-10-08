class AddPlantRefToPlots < ActiveRecord::Migration[5.1]
  def change
    add_reference :plots, :plant, foreign_key: true
  end
end
