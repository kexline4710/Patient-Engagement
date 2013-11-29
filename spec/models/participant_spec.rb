require 'spec_helper.rb'

describe Participant do
	let(:participant) {FactoryGirl.build(:participant)}

	describe "validations" do 
		it {should validate_presence_of(:email)}
		it {should validate_uniqueness_of(:email)}
		it {should validate_presence_of(:password)}
		it {should have_secure_password}
	end

end


	