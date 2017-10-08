class AddUserRefToPlots < ActiveRecord::Migration[5.1]
  def change
    add_reference :plots, :user, foreign_key: true
  end
end
