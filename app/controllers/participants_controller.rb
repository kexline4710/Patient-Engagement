class ParticipantsController < ApplicationController

	def index
	end

	def create
	end

  def show
    current_user = Participant.create(email: "p@dbc.com", password_digest: "password")
    @questions = current_user.questions.all
  end

end
