class ParticipantsController < ApplicationController
	include ApplicationHelper

	def index
	end

	def create
	end

  def show
    # want to take this line out as soon as current_user is implemented
    @questions = five_recent_questions
  end

end
