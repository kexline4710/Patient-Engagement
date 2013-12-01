class CoordinatorsController < ApplicationController
  include ApplicationHelper

  def show
    @participants = current_user.participants
  end

end