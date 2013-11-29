require 'spec_helper'

describe 'log-in' do 
	let(:participant) {FactoryGirl.create(:participant)}
		
		it "allows log-in" do
			visit root_path
			fill_in "Email", :with => participant.email
			fill_in "Password", :with => participant.password
			click_button "Login"
		end

		# it "allows a valid participant to login"

		# it "allows a valid coordinator to login"
end