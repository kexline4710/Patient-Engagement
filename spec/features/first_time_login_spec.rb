require 'spec_helper'

describe "First Time User Reset" do
	subject { page }

	describe "login page" do
    before { visit root_path }
    it { should have_content('Email') }
  end

  describe "allows first time user to login" do
  	  participant  = FactoryGirl.create(:participant, first_time_login: true)

  		before do
  		visit root_path
      fill_in "Email",    with: participant.email
      fill_in "Password", with: participant.password
      click_button "Login"
    	end
    	it { should have_content('Reset Password') }
  			it "allows participant to reset password" do
	  			fill_in "Password", with: "Alexander"
	  			fill_in "Password Confirmation", with: "Alexander"
	  			click_button "Update Password"
				expect(page).to have_content("Email")
	  		end
	 end
end



