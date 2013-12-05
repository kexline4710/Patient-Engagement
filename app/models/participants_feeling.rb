class ParticipantsFeeling < ActiveRecord::Base
	 include ActiveModel::ForbiddenAttributesProtection
  

  belongs_to :feeling
  belongs_to :participant
end
