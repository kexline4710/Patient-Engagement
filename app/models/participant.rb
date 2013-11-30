class Participant < ActiveRecord::Base
  attr_accessible :email, :password_digest, :first_name, :last_name, :password
  has_many :questions
  

  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

  def self.authenticate_participant(password, email)
		participant = Participant.find_by_email(email)
		if participant
		end
	end

end
