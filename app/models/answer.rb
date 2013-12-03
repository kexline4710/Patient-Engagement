class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :coordinator_id, :viewed
  belongs_to :question

  
end
