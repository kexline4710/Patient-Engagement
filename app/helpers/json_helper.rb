module JsonHelper 

	def new_participant(line)
		p=Participant.new
		p.first_name     = line["participant_1"][0]
		p.last_name	     = line["participant_1"][1]
		p.email			     = line["participant_1"][2]
		p.phone_number	 = line["participant_1"][3]
		p.password       = line["participant_1"][4]
		p.subject_number = line["participant_1"][5]
		p.save!
	end
end