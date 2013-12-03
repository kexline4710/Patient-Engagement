require 'spec_helper'

describe "Participant submits question" do

  describe "with complete information" do
    let(:question) { FactoryGirl.create(:question) }
    let(:coordinator) { FactoryGirl.create(:coordinator) }
    let(:trial) { FactoryGirl.create(:trial)}
    let(:participant) { FactoryGirl.create(:participant, :coordinator_id => coordinator.id) }
    before(:each) do
      visit root_path
      fill_in "Email",    with: participant.email
      fill_in "Password", with: participant.password
      click_button "Login"
      find(:xpath, "//a[@href='/participants/#{participant.authenticity_token}/questions/new']").click
      fill_in 'Title', with: question.title
      fill_in 'Content', with: question.content
    end

    it 'should direct to dashboard' do
      click_button 'Submit'
      expect(page).to have_content('Welcome')
    end

    it "should mark a question private if a participant checks private" do
      # rakclick_buton "question[private]"
      click_button 'Submit'
    end

  end
end
