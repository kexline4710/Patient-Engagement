class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  def first_time_visiting?
  	if current_user.try(:first_time_login)
  		current_user.first_time_login = false
  		current_user.save
  		redirect_to edit_password_reset_path(current_user.authenticity_token)
  	else
  		return
  	end
  end

end
