class Coordinator < ActiveRecord::Base
  # Helpers should not be mixed into models. Helpers are for views
  # What is the purpose of this?
	include ApplicationHelper

  attr_accessible :email, :password, :authenticity_token, :first_name

  before_create {generate_token(:authenticity_token)}
  # CODE REVIEW: you can move validations for a given attribute to one line
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

  has_many :participants

  def send_question_notification_email
  	UserMailer.notify_coordinator_new_question(self).deliver
  end
end
