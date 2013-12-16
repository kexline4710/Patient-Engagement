class Coordinator < ActiveRecord::Base
 include ActiveModel::ForbiddenAttributesProtection


  before_create {generate_token(:authenticity_token)}


## There should be a validation for password length.  -clm
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

## Is Coordinator relation to participant_files neccesary?  -clm
  has_many :participant_files
  has_many :participants
  belongs_to :trial

  def send_question_notification_email
  	UserMailer.notify_coordinator_new_question(self).deliver
  end

## Is the (column) parameter necessary? Checkout the Hartl tutorial;
## http://ruby.railstutorial.org/chapters/sign-in-sign-out?version=3.2#sec-remember_me  -clm
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Coordinator.exists?(column => self[column])
  end
end
