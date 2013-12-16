class CoordinatorsController < ApplicationController
  include ApplicationHelper

  def index

  end

  def show
    @questions = []

## @participants = Participant.where(coordinator_id: current_user.id).order(:subject_number) -clm
    @participants =Participant.where("coordinator_id = ?", current_user.id).order("subject_number ASC")
    @participants.each do |participant|
     participant.questions.each do |question|
      @questions << question if question.answered == false
      end
    end
  end

  def archive
## participant = Participant.find_by_subject_number(params[:subject_number]) -clm
    participant = Participant.search(params[:subject].to_i)[0]
    if participant
      @questions = participant.questions
      @feelings = participant.feelings.order(:created_at)
    else
      flash[:message] = ["Subject with that number was not found"]
      redirect_to coordinator_path(current_user.authenticity_token)
    end
  end

  private

  def coordinator_params
    params.require(:coordinator).permit!
  end

end