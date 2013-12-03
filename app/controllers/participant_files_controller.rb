class ParticipantFilesController < ApplicationController
  include ApplicationHelper
  	include JsonHelper


	def new
		# File.open(File.join(Rails.root, 'lib', 'assets', '3.json')) do |f|
		# 	f.each_line do |line|
		# 		this_line = JSON.parse(line)
		# 		keyset= "participant_1"
		# 		remainders = this_line.slice!(*keyset)
		# 		new_participant(this_line)
		# 	end
		# end	
	end

	def create
		subject_list = params[:participant_file][:subject_list]
		 json_list = subject_list.read
		 parsed_list = JSON.parse(json_list)
		 parsed_list.each do |key, value| 
		 		new_participant(value)
		 end
		 flash[:message] = ["#{parsed_list.length} Participants Uploaded Successfully"]
		 redirect_to participant_files_path
	end

	def index

	end

end