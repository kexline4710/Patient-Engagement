class Participant < ActiveRecord::Base
	include ApplicationHelper

  attr_accessible :email, :first_name, :last_name, :password, :authenticity_token, :password_digest, :password_confirmation, :first_time_login, :subject_number


  before_create { generate_token(:authenticity_token) }
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

  belongs_to :coordinator
  has_many :questions

  def send_initial_email
  	UserMailer.welcome_email(self).deliver
  end

  def self.generate_password
    SecureRandom.base64(n=6)
  end
end