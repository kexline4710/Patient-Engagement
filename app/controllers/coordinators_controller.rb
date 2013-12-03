class CoordinatorsController < ApplicationController
  include ApplicationHelper

  def index

  end

  def show
  	questions = []
    @participants = current_user.participants
    @participants.each do |participant|
    		questions = participant.questions
    end
    if questions.length > 0
    flash[:message] = ["You have #{questions.length} unanswered questions"]
   	end
   end

end