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
  # has_many :plants, through: :plots
  has_many :comments, dependent: :destroy
  has_secure_token :api_token
  has_secure_password

  #Paperclip for User profile pictures
  has_attached_file :avatar,
    styles: {
      medium: "300x300>",
      thumb: "100x100>"},
    convert_options: {
      original: '-quality 90',
      thumb: '-quality 70 -strip'},
    storage: :s3,
    s3_credentials: {
      bucket: ENV['S3_BUCKET_NAME'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      s3_region: ENV['AWS_REGION'],
      S3_host_name: ENV['S3_HOST_NAME']},
    s3_protocol: 'https',
    default_url: '/images/:style/missing.png',
    url: '/system/:hash.:extension',
    hash_secret: ENV['HASH_SECRET']

    validates_attachment :avatar,
      content_type: { content_type: /\Aimage\/.*\z/ },
      size: { less_than: 5.megabyte }

  has_many :plots, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_token :api_token
  has_secure_password

  attr_accessor :activation_token, :reset_token

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
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def recreate_activation_digest
    self.activation_token = User.new_token
    update_attribute(:activation_digest,  User.digest(activation_token))
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
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
