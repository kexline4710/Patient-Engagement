class Trial < ActiveRecord::Base
  attr_accessible :information, :number, :title

  has_many :coordinators
end
