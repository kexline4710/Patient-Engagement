class Coordinator < ActiveRecord::Base
	include ApplicationHelper
	
  attr_accessible :email, :password_digest, :authenticity_token
  before_create {generate_token(:authenticity_token)}

  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :presence => true
  has_secure_password
end
