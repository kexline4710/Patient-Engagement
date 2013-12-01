class UserMailer < ActionMailer::Base
  default from: "Winston.Thorman@gmail.com"

  def welcome_email(participant)
  	 @participant = participant
  	 @url = "http://patientengagement.herokuapp.com/"
  	 mail(to: @participant.email, subject: 'Welcome to <NAME OF APP>! Important Password information in this email')
	end

end
