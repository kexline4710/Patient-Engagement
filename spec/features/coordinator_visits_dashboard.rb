require 'spec_helper'

describe "the coordinator dashboard" do

  subject { page }

  describe "should display participant's questions" do
    let(:coordinator) { FactoryGirl.create(:coordinator) }
    let(:participant) { FactoryGirl.create(:participant) }
    let(:question) { FactoryGirl.create(:question) }
    before do
      participant.questions << question
      coordinator.participants << participant
      visit root_path
      fill_in "Email",    with: coordinator.email
      fill_in "Password", with: coordinator.password
      click_button "Login"
    end
    it { should have_content(question.title) }
  end
end

