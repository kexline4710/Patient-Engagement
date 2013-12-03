class ParticipantFile < ActiveRecord::Base
	has_attached_file :subject_list
	validates_attachment :subject_list, content_type: { content_type: 'application/json'}


	attr_accessible :subject_list

	belongs_to :coordinator

end