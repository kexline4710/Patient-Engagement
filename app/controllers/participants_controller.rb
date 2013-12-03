class ParticipantsController < ApplicationController
	include ApplicationHelper

	def index
	end

	def create
	end

  def show
    @questions = five_recent_questions
    @feelings = Feeling.all
    @current_feeling = current_user.feeling.emotion
  end

  def update
  	current_user.update_attribute(:feeling_id, params[:feeling_id])
    redirect_to participant_path(current_user)
  end

end
