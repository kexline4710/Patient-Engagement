class ParticipantsFeelingsController < ApplicationController
  include ApplicationHelper



  private

  def participants_feeling_params
  	params.require(:participants_feeling).permit!
  end

end