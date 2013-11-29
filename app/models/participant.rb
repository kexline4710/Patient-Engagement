class Participant < ActiveRecord::Base
  attr_accessible :email, :password_digest
  

  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :presence => true
  has_secure_password
end
