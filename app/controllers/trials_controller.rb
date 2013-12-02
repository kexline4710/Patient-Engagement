class TrialsController < ApplicationController
  protect_from_forgery
  include ApplicationHelper

  def show
    @trial = Trial.find(current_trial_id)
  end
end