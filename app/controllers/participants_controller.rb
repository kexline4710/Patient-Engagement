class ParticipantsController < ApplicationController
	include ApplicationHelper

	def index
	end

	def create
	end

  def show
    # want to take this line out as soon as current_user is implemented
    @questions = current_user.questions.all
  end

end
