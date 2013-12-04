class ParticipantFilesController < ApplicationController
  include ApplicationHelper
  	include JsonHelper


	def new
	end

	def create
	 parse_subject_list(params[:participant_file][:subject_list],params[:participant_file][:current_user])
			
		if true
		 flash[:message] = ["Participants Uploaded Successfully"]
		 redirect_to coordinator_path(current_user)
		else
			flash[:message] = ["Participants were not loaded successfully, please try again"]
			redirect_to coordinator_path(current_user)
		end
	end

	def index

	end

end