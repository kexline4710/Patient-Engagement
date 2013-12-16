class ParticipantFilesController < ApplicationController
  include ApplicationHelper
  	include JsonHelper


	def new
	end

	def create

## This could be passed like parse_subject_list(params[:participant_file]) and retrieved like
## def parse_subject_list(participant_file) ; participant_file[:subject_list], etc.. -clm
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

	private

	def participant_file_params
		params.require(:participant_file).permit!
	end

end