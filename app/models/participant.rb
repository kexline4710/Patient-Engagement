class Participant < ActiveRecord::Base
	include ApplicationHelper

  attr_accessible :email, :first_name, :last_name, :password, :authenticity_token, :password_digest, :password_confirmation, :first_time_login, :subject_number


  before_create { generate_token(:authenticity_token) }
  # before_create { generate_password }
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

  belongs_to :coordinator
  has_many :questions

  def send_initial_email(password)
  	UserMailer.welcome_email(self, password).deliver
  end

  def generate_password
    password = SecureRandom.hex(n=4)
    self.update_attribute(:password, password)
    self.send_initial_email(password)
  end
end