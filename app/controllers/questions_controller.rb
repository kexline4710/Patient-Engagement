class QuestionsController < ApplicationController

  def new
  end

  def create
    current_user = Participant.find(1)
    current_user.questions.create(params[:question])
    # p question
    redirect_to participant_path(current_user)
  end

end
