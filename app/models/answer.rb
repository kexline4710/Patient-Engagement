class Answer < ActiveRecord::Base
	 include ActiveModel::ForbiddenAttributesProtection
 
  belongs_to :question

  
end
