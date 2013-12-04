class CoordinatorsController < ApplicationController
  include ApplicationHelper

  def index

  end

  def show
    @questions = []
    @participants =Participant.where("coordinator_id = ?", current_user.id).order("subject_number ASC")
    @participants.each do |participant|
     participant.questions.each do |question|
      @questions << question if question.answered == false
      end
    end
  end

   def archive
     participant = Participant.search(params[:subject].to_i)
     if participant.length > 0
      @questions = participant[0].questions
    else
      flash[:message] = ["Subject with that number was not found"]
      redirect_to coordinator_path(current_user.authenticity_token)
    end
  end
end