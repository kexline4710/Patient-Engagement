class Coordinator < ActiveRecord::Base
	include ApplicationHelper

  attr_accessible :email, :password, :authenticity_token, :first_name, :trial_id

  before_create {generate_token(:authenticity_token)}
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

  has_many :participants
  belongs_to :trial

  def send_question_notification_email
  	UserMailer.notify_coordinator_new_question(self).deliver
  end
end
