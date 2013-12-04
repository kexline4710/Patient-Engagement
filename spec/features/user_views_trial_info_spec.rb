require 'spec_helper'

describe "the participant navbar" do

  subject { page }

  describe "participant views trial info" do
    let(:coordinator) { FactoryGirl.create(:coordinator) }
    let(:participant) { FactoryGirl.create(:participant) }
    let(:trial) { FactoryGirl.create(:trial) }
    before do
      participant.trial = trial
      visit root_path
      fill_in "Email",    with: participant.email
      fill_in "Password", with: participant.password
      click_button "Login"
    end
    it { should have_link('Trial Info'); }
    #find(:xpath, "//a[@href='/foo']").click
  end

  describe "participant views trial info" do
    let(:coordinator) { FactoryGirl.create(:coordinator) }
    let(:trial) { FactoryGirl.create(:trial) }
    before do
      coordinator.trial_id = trial.id
      coordinator.save
      visit root_path
      fill_in "Email",    with: coordinator.email
      fill_in "Password", with: coordinator.password
      click_button "Login"
      find(:link, "Trial Info").click
    end
    it { should have_content('Trial of Oral') }
  end
end