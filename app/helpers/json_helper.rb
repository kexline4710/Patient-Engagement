module JsonHelper 

	def parse_subject_list(subject_list,coordinator_id)

		json_list = subject_list.read
		 parsed_list = JSON.parse(json_list)
		 parsed_list.each do |key, value| 
		 		new_participant(value, coordinator_id)
		 end
	end

	def new_participant(subject,coordinator)
		p=Participant.new
		p.first_name     = subject[0]
		p.last_name	     = subject[1]
		p.email			     = subject[2]
		p.phone_number	 = subject[3]
		p.password       = subject[4]
		p.subject_number = subject[5]
		p.coordinator_id = coordinator.to_i
		p.save!
	end
end