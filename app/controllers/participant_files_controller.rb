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
		# file = params[:subject_list]
		#  json = File.read('file')
		#  obj= JSON.parse(json)

		#  puts obj
	end


end