module ApplicationHelper


	def current_user

		if Coordinator.exists?(:authenticity_token => session[:authenticity_token])
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

  def five_recent_questions
    Question.where("private = ? AND answered = ?", false, true).order("updated_at DESC").limit(5)
  end

  def feelings
    Feeling.all
  end
end
