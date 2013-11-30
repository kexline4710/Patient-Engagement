require 'spec_helper.rb'

describe Participant do
	participant = FactoryGirl.build(:participant)
	describe "validations" do 
		it {should validate_presence_of(:email)}
		it {should validate_uniqueness_of(:email)}
		it {should validate_presence_of(:password)}
		it {should have_secure_password}
	end

	describe "associations" do
		it { should have_many(:questions)}
	end

	describe "authenticate is defined" do
		subject {Participant}
		it {should respond_to :authenticate_participant }
	end

	describe "authenticate accepts two parameters" do
		subject {Participant}
		it "should raise an ArgumentError error if no parameters are passed" do
			expect{ Participant.authenticate_participant }.to raise_error(ArgumentError)
		end
	end

	describe "authenticate validates participant" do
			before {participant.save}
			let(:found_user) {Participant.find_by_email(participant.email)}
		it "should find participant by email" do
			expect(participant.email).to eql(found_user.email)	
		end
	end

  # describe "#questions" do
  #   let(:test_question) {FactoryGirl.create(:question, participant_id: participant.id)}
    
  #   it "returns all of a participant's questions" do
  #     expect(participant.questions).to eq([test_question])
  #   end 
  # end


end


	
