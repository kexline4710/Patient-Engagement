class ParticipantsFeeling < ActiveRecord::Base
  attr_accessible :feeling_id, :participant_id

  belongs_to :feeling
  belongs_to :participant
end
