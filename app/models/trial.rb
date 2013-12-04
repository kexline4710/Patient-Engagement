class Trial < ActiveRecord::Base
	 include ActiveModel::ForbiddenAttributesProtection
 

  has_many :coordinators
end
