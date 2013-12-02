module ApplicationHelper


	def current_user
<<<<<<< HEAD
		if Coordinator.find_by_authenticity_token(session[:authenticity_token]).nil?
			@current_user ||= Participant.find_by_authenticity_token(session[:authenticity_token]) if session[:authenticity_token]
		else
=======
		if Coordinator.exists?(:authenticity_token => session[:authenticity_token])
>>>>>>> 1e28769a2990a8620f75c477d533c1e985d004b1
			@current_user ||= Coordinator.find_by_authenticity_token(session[:authenticity_token]) if session[:authenticity_token]
		else
			@current_user ||= Participant.find_by_authenticity_token(session[:authenticity_token]) if session[:authenticity_token]
		end
	end

  def current_trial_id
    if current_user.trial
      return current_user.trial.id
    else
      1
    end
  end
end
