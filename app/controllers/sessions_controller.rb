class SessionsController < ApplicationController
  include ApplicationHelper

	def new
	end

  def create
    user = Coordinator.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      cookies[:authenticity_token] = user.authenticity_token
      redirect_to "/coordinators/#{user.authenticity_token}" and return
    else
      user = Participant.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        cookies[:authenticity_token] = user.authenticity_token
        redirect_to "/participants/#{user.authenticity_token}" and return
      end
    end
    flash[:notice] = "Invalid Password or Email Address"
    redirect_to root_path
  end

  def destroy
    cookies.delete(:authenticity_token)
    redirect_to root_path
  end
end
