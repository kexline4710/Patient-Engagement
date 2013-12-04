class Trial < ActiveRecord::Base
	 include ActiveModel::ForbiddenAttributesProtection
  # attr_accessible :information, :number, :title

  has_many :coordinators
end
