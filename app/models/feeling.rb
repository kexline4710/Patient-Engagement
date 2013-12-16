class Feeling < ActiveRecord::Base
	 include ActiveModel::ForbiddenAttributesProtection

## This can be replaced with a participants_feeling most_recent method.  -clm
  has_many :participants
end
