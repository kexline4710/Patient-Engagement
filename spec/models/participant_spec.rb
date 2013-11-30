require 'spec_helper.rb'

describe Participant do
	let(:participant) {FactoryGirl.build(:participant)}

	describe "validations" do 
		it {should validate_presence_of(:email)}
		it {should validate_uniqueness_of(:email)}
		it {should validate_presence_of(:password)}
		it {should have_secure_password}
	end

	describe "authenticate is defined" do
		subject {Participant}
		it {should respond_to :authenticate_participant }
	end

	describe "authenticate accepts two parameters" do
		it "should raise an ArgumentError error if no param eters are passed" do
			expect { participant.authenticate }.to raise_error(ArgumentError)
		end
	end

	describe "authenticate validates participant" do
			subject {:participant}
			before {participant.save}
			let(:found_user) {Participant.find_by_email(participant.email)}

		describe "should find participant by email" do
			expect(participant.email).to eql(found_user.email)	
		end


		
	end

end


	