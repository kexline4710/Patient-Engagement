module ApplicationHelper

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while Coordinator.exists?(column => self[column]) || Participant.exists?(column => self[column])
	end

	def current_user

		if Coordinator.find_by_authenticity_token(session[:authenticity_token]).nil?
			@current_user ||= Participant.find_by_authenticity_token(session[:authenticity_token]) if session[:authenticity_token]
		else
			@current_user ||= Coordinator.find_by_authenticity_token(session[:authenticity_token]) if session[:authenticity_token]
		end
	end
end
