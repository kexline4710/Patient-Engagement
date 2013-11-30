class ParticipantsController < ApplicationController

	def index
	end

	def create
	end

  def show
    # want to take this line out as soon as current_user is implemented
    current_user = Participant.find(params[:id])
    @questions = current_user.questions.all
  end

end
