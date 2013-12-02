class Question < ActiveRecord::Base
  attr_accessible :title, :content, :participant_id

  belongs_to :participant
  has_one :answer

  def coordinator_name
    puts "***********************************************"
    puts self.answer.coordinator_id
    puts "***********************************************"

    Coordinator.find(self.answer.coordinator_id).first_name
  end
end
