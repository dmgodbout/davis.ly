# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'bcrypt'
class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates :name,  presence: true, length: { maximum: 50 }
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates :email, presence: true, #format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
