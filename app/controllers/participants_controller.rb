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

  def update
  	id = params[:feeling_id]
  	p id
  	current_user.update_attribute(feeling_id: params[:feeling_id])
  end

end
