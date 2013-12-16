class AnswersController < ApplicationController
  protect_from_forgery
  include ApplicationHelper

  def new
    @question = Question.find(params[:question].to_i)
    @participant = @question.participant
  end

  def create
    if params[:answer][:content].empty?
      @question = Question.find(params[:question_id])
      @participant = Participant.find(@question.participant_id)
      flash[:message] = ["You didn't provide an answer!"]
      redirect_to new_answer_path(:question => params[:question_id])
      return
    end
    content = params[:answer][:content]
    question = Question.find(params[:question_id].to_i)

## Can this be configured to; answer = Answer.create(params[:answer])? -clm
    answer = Answer.create(content: content, question_id: question.id, coordinator_id: current_user.id)
    question.update_attribute(:private, true) if params[:answer][:private] == "1"

## question.update_attribute(:answered, true) -clm
    question.answered = true
    question.save
    flash[:message] = ["\"#{question.title}\" answered and added to archive"]
    redirect_to coordinator_path(current_user)
  end

  def index
    @answers = current_user.answers_unviewed
    @answers.each do |answer|
      answer.update_attribute(:viewed, true)
    end
  end

  private

## Should this be answer_params? -clm
  def coordinator_params
    params.require(:answer).permit!
  end

end