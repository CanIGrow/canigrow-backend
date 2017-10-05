class User < ApplicationRecord
  has_secure_token :api_token
  has_secure_password

  before_validation :downcase_email
  before_validation :downcase_username

  validates :email, uniqueness: true, format: {/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
  
  validates_uniqueness_of :username


  private

  def downcase_email
    email.downcase if email
  end

  def downcase_username
    username.downcase if username
  end

end
