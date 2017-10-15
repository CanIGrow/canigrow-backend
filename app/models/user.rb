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
  has_many :plots, dependent: :destroy
  has_many :plants, through: :plots
  has_secure_token :api_token
  has_secure_password

  attr_accessor :activation_token

  before_validation :downcase_email
  before_validation :downcase_username

  validates :email,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  validates_uniqueness_of :username

  before_create :create_activation_digest
  # before_create :db_seed

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end


  private

  # def db_seed
  #   self.activated = true
  #   self.activated_at = Time.zone.now
  # end

  def downcase_email
    email.downcase if email
  end

  def downcase_username
    username.downcase if username
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
