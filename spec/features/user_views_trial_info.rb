require 'spec_helper'

describe "the participant navbar" do

  subject { page }

  describe "participant views trial info" do
    let(:participant) { FactoryGirl.create(:participant) }
    let(:trial) { FactoryGirl.create(:trial) }
    before do
      visit root_path
      fill_in "Email",    with: participant.email
      fill_in "Password", with: participant.password
      click_button "Login"
    end
    it { should have_link('Trial Info', {href: '#'}) }
    #find(:xpath, "//a[@href='/foo']").click
  end
end