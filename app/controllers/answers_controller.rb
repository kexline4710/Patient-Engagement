class AnswersController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  def new
    @question = Question.find(params[:question].to_i)
    @participant = @question.participant
  end

  def create
    content = params[:answer][:content]
    question = Question.find(params[:question_id].to_i)
    answer = Answer.create(content: content)
    current_user.participant.send_question_answered_email
    redirect_to coordinator_path(current_user)
  end
end