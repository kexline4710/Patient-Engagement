class CoordinatorsController < ApplicationController
  include ApplicationHelper

  def index

  end

  def show
  	collection = []
    @participants = current_user.participants
   end

end