class User < ApplicationRecord
  has_secure_token :api_token
  has_secure_password
  validates_uniqueness_of :email
  validates_uniqueness_of :usernam e

  before_validation :downcase_email
  before_validation :downcase_username

  private

  def downcase_email
    email.downcase if email
  end

  def downcase_username
    username.downcase if username
  end

end
