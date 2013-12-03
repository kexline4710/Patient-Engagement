class Feeling < ActiveRecord::Base
  attr_accessible :emotion

  has_many :participants
end
