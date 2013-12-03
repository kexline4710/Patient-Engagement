class CoordinatorsController < ApplicationController
  include ApplicationHelper

  def index
  end

  def show
    @participants = current_user.participants
  end

end