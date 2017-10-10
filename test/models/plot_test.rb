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

require 'test_helper'

class PlotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
