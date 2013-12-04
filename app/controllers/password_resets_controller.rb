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
    if params[:participant][:password_digest].length > 6
      if params[:participant][:password_digest] == params[:participant][:password_confirmation]
       	if participant.update_attributes(password: params[:participant][:password_digest])
       		flash[:message] = ["Password Updated!"]
          session.clear
       	redirect_to login_path
        end
   	  else
        flash[:message] = ["Password and password confirmation must match!"]
        redirect_to edit_password_reset_path(participant.authenticity_token)
      end
    else
      flash[:message] = ["Password must be at least 6 characters!"]
      redirect_to edit_password_reset_path(participant.authenticity_token)
    end
  end
end