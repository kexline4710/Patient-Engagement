class ParticipantFilesController < ApplicationController
  include ApplicationHelper
  	include JsonHelper


	def new
	end

	def create
	 parse_subject_list(params[:participant_file][:subject_list],params[:participant_file][:current_user])
			
		if true
		 flash[:message] = ["Participants Uploaded Successfully"]
		 redirect_to participant_files_path
		else
			flash[:message] = ["Participants were not loaded successfully, please try again"]
			redirect_to new_participant_files_path
		end
	end

	def index

	end

end