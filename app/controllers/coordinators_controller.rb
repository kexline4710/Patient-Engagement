class CoordinatorsController < ApplicationController
  include ApplicationHelper

  def index

  end

  def show
  	questions = []
    @participants = current_user.participants
    @participants.each do |participant|
    		@questions = participant.questions
    end
    if questions.length > 0
    flash[:message] = ["You have #{questions.length} unanswered questions"]
   	end
   end

   def archive
      participant = Participant.search(params[:subject].to_i)
      @questions = participant[0].questions
      @feelings = participant[0].feelings.order(:created_at)
  end
end