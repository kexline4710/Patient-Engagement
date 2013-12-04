class DashboardsController < ApplicationController
  include ApplicationHelper


  def show
    if current_user.class == Participant
      redirect_to participant_path(current_user.authenticity_token)
    else
      redirect_to coordinator_path(current_user.authenticity_token)
    end
  end
end