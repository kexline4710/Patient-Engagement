module ApplicationHelper

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while Coordinator.exists?(column => self[column]) || Participant.exists?(column => self[column])
	end

	def current_user
<<<<<<< HEAD
	if Coordinator.find_by_authenticity_token(cookies[:authenticity_token]).nil?
			@current_user ||= Participant.find_by_authenticity_token(cookies[:authenticity_token]) if cookies[:authenticity_token]
=======
		if Coordinator.find_by_authenticity_token(session[:authenticity_token]).nil?
			@current_user ||= Participant.find_by_authenticity_token(session[:authenticity_token]) if session[:authenticity_token]
>>>>>>> f7e31e8c824a430f3a434c94a6fae2e43473bfbe
		else
			@current_user ||= Coordinator.find_by_authenticity_token(session[:authenticity_token]) if session[:authenticity_token]
		end
	end
end
