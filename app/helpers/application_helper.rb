module ApplicationHelper

## This helper should live in application_controller.rb see
## http://apidock.com/rails/AbstractController/Helpers/ClassMethods/helper_method  -clm
	def current_user

## if Coordinator.exists?(authenticity_token: session[:authenticity_token])
##    Coordinator.find_by_authenticity_token(session[:authenticity_token])
## else
##    Participant.find_by_authenticity_token(session[:authenticity_token])
## end  -clm
		if Coordinator.exists?(:authenticity_token => session[:authenticity_token])
			@current_user ||= Coordinator.find_by_authenticity_token(session[:authenticity_token]) if session[:authenticity_token]
		else
			@current_user ||= Participant.find_by_authenticity_token(session[:authenticity_token]) if session[:authenticity_token]
		end
	end


## This method is not neccesary. Replace with @coordinator/@participant.trial
## in view.  -clm
## There should be a vailidation in respective models that requires trial
## number.  -clm
  def current_trial_id
    if current_user.trial
      return current_user.trial.id
    else
      1
    end
  end

  def five_recent_questions
    Question.where("private = ? AND answered = ?", false, true).order("updated_at DESC").limit(5)
  end

## This method is not necessary and can be confused with @participant.feelings.
  def feelings
    Feeling.all
  end
end
