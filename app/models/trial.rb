class Trial < ActiveRecord::Base
  attr_accessible :information

  has_many :coordinators
end
