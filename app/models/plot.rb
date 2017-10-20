# == Schema Information
#
# Table name: plots
#
#  id         :integer          not null, primary key
#  name       :string
#  notes      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Plot < ApplicationRecord
  belongs_to :user
  has_many :plants_plots
  has_many :plants, through: :plants_plots
end
