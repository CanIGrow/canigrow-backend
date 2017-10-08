class Plant < ApplicationRecord
  has_and_belongs_to_many :plots, :through => :plants_plots
  has_and_belongs_to_many :users, through: :plots
end
