class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  include ApplicationHelper

## Bug - if first_time_login is triggered and user doesn't reset password,
## but instead log's out the next time they login they can login with the
## sent password. Also there is no check if the new password is different
## than the old. -clm
  def first_time_visiting?
  	if current_user.try(:first_time_login)
  		current_user.update_attributes(:first_time_login => false)
      current_user.save(validate: false)

## redirect_to edit_password_reset_path(current_user) and return
## There is no need to specify authenticity_token for path.  -clm
  		redirect_to edit_password_reset_path(current_user.authenticity_token) and return
  	else
     redirect_to participant_path(current_user.authenticity_token) and return
  	end
  end

  def require_login
    if current_user
      return current_user
    else
      redirect_to login_path
    end
  end
end
