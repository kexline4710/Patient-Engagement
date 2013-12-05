require 'spec_helper'

describe "the participant dashboard" do

  subject { page }

  describe "the participant checks status of pending questions" do

    describe "there is one pending question" do
      let(:feeling) { FactoryGirl.create(:feeling) }
      let(:participant) { FactoryGirl.create(:participant) }
      let(:question) { FactoryGirl.create(:question)}
      before do
        # participant.feeling = feeling
        participant.questions << question
        visit root_path
        fill_in "Email",    with: participant.email
        fill_in "Password", with: participant.password
        click_button "Login"
      end
      it { should have_content("pending") }
    end
  end
end