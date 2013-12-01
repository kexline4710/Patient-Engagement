class Coordinator < ActiveRecord::Base
	include ApplicationHelper

  attr_accessible :email, :password, :authenticity_token

  before_create {generate_token(:authenticity_token)}
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

  has_many :participants

  def send_question_notification_email
  	UserMailer.notify_coordinator_new_question(self).deliver
  end
end
