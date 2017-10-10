# == Schema Information
#
# Table name: zones
#
#  id         :integer          not null, primary key
#  zip        :integer
#  zone       :string
#  temp_range :string
#  concat     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Zone < ApplicationRecord
end
