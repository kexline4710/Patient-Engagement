class AnswersController < ApplicationController
  protect_from_forgery
  include ApplicationHelper

  def new
    @question = Question.find(params[:question].to_i)
    @participant = @question.participant
  end

  def create
    content = params[:answer][:content]
    question = Question.find(params[:question_id].to_i)
    answer = Answer.create(content: content, question_id: question.id, coordinator_id: current_user.id)
    flash[:message] = ["#{question.title} answered and added to archive"]
    # current_user.coordinator.send_quest
    redirect_to coordinator_path(current_user)
  end

  def
end