class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :coordinator_id
  belongs_to :question

  
end
