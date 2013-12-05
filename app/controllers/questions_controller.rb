class QuestionsController < ApplicationController
  include ApplicationHelper

  def new
  end

  def create
    if params[:question][:title].empty?
      flash[:content] = params[:question][:content]
      flash[:message] = ["You need to enter a title to your question."]
      render "questions/new"
      return
    end
    current_user.questions.create(question_params)
    current_user.coordinator.send_question_notification_email
      if request.xhr?
        render json: {success: true}
      else 
       redirect_to participant_path(current_user)
      end
  end

  def index
    @questions = current_user.questions.order("updated_at DESC")
  end

  def all
    @questions = Question.where("private = ? AND answered = ?", false, false).order("updated_at DESC")
  end

  private

  def question_params
    params.require(:question).permit!
  end
  
end
