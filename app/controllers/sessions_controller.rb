class SessionsController < ApplicationController
  include ApplicationHelper
  skip_before_filter :require_login

	def new
	end

## Checkout Hartl tutorial for expanded security with a token;
##  http://ruby.railstutorial.org/chapters/supplement?version=3.2#sec-encrypted_remember_tokens  -clm
  def create
      user = Coordinator.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:authenticity_token] = user.authenticity_token
      redirect_to "/coordinators/#{user.authenticity_token}"
    else
      user = Participant.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
          session[:authenticity_token] = user.authenticity_token
          first_time_visiting?
        else
          flash[:message] = ["Invalid email or Password"]
          redirect_to login_path
      end
    end
  end

  def destroy

## session.reset!
    session.delete(:authenticity_token)
    redirect_to login_path
  end
end
