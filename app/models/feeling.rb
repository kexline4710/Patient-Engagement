class Feeling < ActiveRecord::Base
	 include ActiveModel::ForbiddenAttributesProtection

  has_many :participants
end
