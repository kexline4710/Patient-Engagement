class ParticipantsController < ApplicationController
	include ApplicationHelper

	def index
	end

	def create
	end

  def show
    @questions = five_recent_questions
    @feelings = Feeling.all
  end

end
