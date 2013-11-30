class SessionsController < ApplicationController

	def new

	end

  def create
    user = Coordinator.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      redirect_to "/coordinators/#{user.id}" and return
    else 
      user = Participant.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        session[:id] = user.id
        redirect_to "/participants/#{user.id}" and return
      end
    end
    flash[:notice] = "Invalid Password or Email Address"
    redirect_to root_path
  end
end