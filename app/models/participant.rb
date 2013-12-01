class Participant < ActiveRecord::Base
	include ApplicationHelper

  attr_accessible :email, :password, :first_name, :last_name, :password, :authenticity_token, :subject_number

  before_create { generate_token(:authenticity_token) }
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

  belongs_to :coordinator
  has_many :questions
end
