require 'spec_helper'

describe "Participant submits questions" do

  describe "with complete information" do
    let(:question) { FactoryGirl.create(:question) }
    let(:participant) { FactoryGirl.create(:participant) }
    

    it 'should direct to dashboard' do
      visit root_path
      fill_in "Email",    with: participant.email
      fill_in "Password", with: participant.password
      click_button "Login"
      visit new_question_path
      fill_in 'Title', with: question.title
      fill_in 'Content', with: question.content
      click_button 'Submit'
      expect(page).to have_content('Welcome')
    end
  end
end
