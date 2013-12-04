class TrialsController < ApplicationController
  protect_from_forgery
  include ApplicationHelper

  def show
    @trial = Trial.find(current_trial_id)
  end

  private

  	def trial_params
  		params.require(:trial).permit!
  	end
end