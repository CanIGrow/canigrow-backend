# == Schema Information
#
# Table name: plants
#
#  id                         :integer          not null, primary key
#  umn_plantID                :string
#  common_name                :string
#  scientific_name            :string
#  height                     :string
#  spread                     :string
#  form                       :string
#  seasonal_interest          :string
#  seasonal_interest_specific :string
#  flower_color               :string
#  landscape_use              :string
#  light                      :string
#  zone                       :string
#  soil                       :string
#  notes                      :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class Plant < ApplicationRecord
  has_and_belongs_to_many :plots, :through => :plants_plots
 -  has_and_belongs_to_many :users, through: :plots
  has_many :comments, dependent: :destroy
end
