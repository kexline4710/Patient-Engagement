require 'spec_helper.rb'

describe Participant do
	let(:participant) {FactoryGirl.build(:participant)}

	describe "email address" do 
		it {should validate_presence_of(:email)}
	end
end


	