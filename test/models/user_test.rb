# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  email           :string
#  password_digest :string
#  bio             :text
#  location        :string
#  api_token       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  zip             :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
