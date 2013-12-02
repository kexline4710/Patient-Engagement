module ApplicationHelper

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while Coordinator.exists?(column => self[column]) || Participant.exists?(column => self[column])
	end

	def current_user
    # CODE REVIEW: Though I'm not a fan of the Coordinator/Participant seperation
    # this code will be better doing:
    #   Coordinator.exists?(:authenticity_token => session[:authenticity_token])
    # this is the difference between
    #   SELECT * FROM coordinators WHERE...
    # and
    #   SELECT COUNT(*) FROM coordinators WHERE...
    # in the current code, a Coordinator/Participant is realized from the DB twice
		if Coordinator.find_by_authenticity_token(session[:authenticity_token]).nil?
			@current_user ||= Participant.find_by_authenticity_token(session[:authenticity_token]) if session[:authenticity_token]
		else
			@current_user ||= Coordinator.find_by_authenticity_token(session[:authenticity_token]) if session[:authenticity_token]
		end
	end
end
