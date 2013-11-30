class Question < ActiveRecord::Base
  attr_accessible :title, :content, :participant_id
end
