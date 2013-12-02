class PasswordResetsController < ApplicationController
  skip_before_filter :require_login


 def new
 end

 def create
 end

 def edit
 	@participant = current_user
 end

 def update
 	participant = current_user
 	if participant.update_attributes(password: params[:participant][:password_digest])
 		flash[:message] = ["Password Updated!"]
 	redirect_to root_path
 	else
 		flash[:message] = participant.errors.full_messages
 		redirect_to edit_password_reset_path(participant.authenticity_token)
 	end
 end

end