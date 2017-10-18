class AddMoreColumnsToPlants < ActiveRecord::Migration[5.1]
  def change
    add_column :plants, :cultivar_group, :string
    add_column :plants, :vitamins, :string
    add_column :plants, :maturity, :string
    add_column :plants, :spring_start_relative_last_frost, :string
    add_column :plants, :transplant_spring_start_relative_last_frost, :string
    add_column :plants, :fall_start_relative_first_frost, :string
    add_column :plants, :transplant_fall_relative_first_frost, :string
  end
end
