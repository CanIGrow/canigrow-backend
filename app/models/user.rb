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

class User < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots
  has_secure_token :api_token
  has_secure_password

  before_validation :downcase_email
  before_validation :downcase_username

  validates :email,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  validates_uniqueness_of :username


  private

  def downcase_email
    email.downcase if email
  end

  def downcase_username
    username.downcase if username
  end

end
