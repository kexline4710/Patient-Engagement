class SessionsController < ApplicationController
  include ApplicationHelper
  # before_filter :first_time_visiting?

	def new
	end

  def create
    # CODE REVIEW:
    # Having Coordinators and Participants being in different objects seems like
    # unecessary complexity. I probably would have made a User object with a "role"
    # and a coordinator_id that is NULL for coordinators. It certainly makes
    # this logic complicated.
      user = Coordinator.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:authenticity_token] = user.authenticity_token
      redirect_to "/coordinators/#{user.authenticity_token}" and return
    else
      user = Participant.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
          session[:authenticity_token] = user.authenticity_token
          first_time_visiting?
        else
          flash[:message] = ["Invalid email or Password"]
          redirect_to root_path
      end
    end
  end

  def destroy
    session.delete(:authenticity_token)
    redirect_to root_path
  end
end
