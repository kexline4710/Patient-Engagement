class ParticipantFile < ActiveRecord::Base
	 include ActiveModel::ForbiddenAttributesProtection
	has_attached_file :subject_list
	validates_attachment :subject_list, content_type: { content_type: 'application/json'}


	

	belongs_to :coordinator

end