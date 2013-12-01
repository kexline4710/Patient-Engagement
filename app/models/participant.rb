class Participant < ActiveRecord::Base
	include ApplicationHelper

<<<<<<< HEAD
  attr_accessible :email, :password, :first_name, :last_name, :password, :authenticity_token, :subject_number
=======
  attr_accessible :email, :first_name, :last_name, :password, :authenticity_token, :password_digest, :password_confirmation, :first_time_login, :subject_number
>>>>>>> f7e31e8c824a430f3a434c94a6fae2e43473bfbe

  before_create { generate_token(:authenticity_token) }
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

  belongs_to :coordinator
  has_many :questions
end
