class PasswordResetsController < ApplicationController


 def new
 end

 def create
 end

 def edit
 	@participant = current_user
 end

 def update
 	participant = current_user
 	participant.update_attributes(password: params[:participant][:password_digest])
 	redirect_to root_path
 end

end