class RemoveTypeFromPlants < ActiveRecord::Migration[5.1]
  def change
    remove_column :plants, :type, :string
  end
end
