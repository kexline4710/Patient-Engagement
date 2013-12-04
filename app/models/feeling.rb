class Feeling < ActiveRecord::Base
	 include ActiveModel::ForbiddenAttributesProtection
  # attr_accessible :emotion

  has_many :participants
end
