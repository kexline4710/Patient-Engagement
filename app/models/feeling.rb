class Feeling < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :participants
end
