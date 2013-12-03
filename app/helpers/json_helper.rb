module JsonHelper 

	def new_participant(line)
		p=Participant.new
		p.first_name     = line[0]
		p.last_name	     = line[1]
		p.email			     = line[2]
		p.phone_number	 = line[3]
		p.password       = line[4]
		p.subject_number = line[5]
		p.save!
	end
end