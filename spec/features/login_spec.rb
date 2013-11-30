require 'spec_helper'

# describe 'log-in' do
# 	let(:participant) {FactoryGirl.create(:participant)}

# 		it "allows  valid participant to login" do
# 			visit root_path
# 			fill_in "Email", :with => participant.email
# 			fill_in "Password", :with => participant.password
# 			click_button "Login"

# 		end

# 		it "allows participant to login to their account" do
#       visit

# 		# it "allows a valid coordinator to login"
# end

describe "Authentication" do

  subject { page }

  describe "login page" do
    before { visit root_path }
    it { should have_content('Email') }
  end


  describe "with valid information" do
    let(:participant) { FactoryGirl.create(:participant) }
    before do
      visit root_path
      fill_in "Email",    with: participant.email
      fill_in "Password", with: participant.password
      click_button "Login"
      save_and_open_page
    end

    it { should have_content('Welcome') }
  end
end
