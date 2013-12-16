class UserMailer < ActionMailer::Base
  default from: "Winston.Thorman@gmail.com"

  def welcome_email(participant, password)
  	 @participant = participant

## Should the url be changed to ~/subjectone...?  -clm
  	 @url = "http://patientengagement.herokuapp.com/"
  	 @password = password
  	 mail(to: @participant.email, subject: 'Welcome to SUBJECT1! Important password information in this email')
	end

## Change to daily email notify_coordinator_new_questions. -clm
	def notify_coordinator_new_question(coordinator)
		@coordinator = coordinator
		@url = "http://patientengagement.herokuapp.com/"
		mail(to: @coordinator.email, subject: 'You have received a new question!')
	end

  def notify_participant_question_answered(participant)
    @participant = participant
    @url = "http://patientengagement.herokuapp.com/"
    mail(to: @participant.email, subject: "You're question has been answered!")
  end
end