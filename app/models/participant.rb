class Participant < ActiveRecord::Base
	include ApplicationHelper

  attr_accessible :email, :first_name, :last_name, :password, :authenticity_token, :password_digest, :password_confirmation, :first_time_login
  has_many :questions
  before_create { generate_token(:authenticity_token) }
  

  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

end
