require 'spec_helper.rb'

describe Participant do
	let(:participant) {FactoryGirl.build(:participant) }
	describe "validations" do
		it {should validate_presence_of(:email)}
		it {should validate_uniqueness_of(:email)}
		it {should validate_presence_of(:password)}
		it {should have_secure_password}
	end

	describe "associations" do
		it { should have_many(:questions)}
    it { should belong_to(:coordinator)}
    it { should have_one(:trial)}
	end

	describe "#send_initial_email" do
		it "sends an initial email" do
			participant.send_initial_email("password")
			expect(ActionMailer::Base.deliveries.last.to).to eq([participant.email])
		end
	end

	describe "generate_password" do
		let(:participant) { FactoryGirl.create(:participant) }

		it "should be 8 characters long" do
			expect(participant.generate_password.length).to eq(8)
		end

		it "should be word characters" do
			expect(participant.generate_password).to match(/\w{8}/)
		end
	end

	describe "validates password" do
		subject {participant}
			it { should ensure_length_of(:password).is_at_least(6).with_message("- must be between 6 and 20 characters")}
	end

  describe "generate_token" do
    subject { participant }
    it "should change authenticity_token" do
      token = participant.authenticity_token
      participant.generate_token(:authenticity_token)
      expect(participant.authenticity_token).to_not eq(token)
    end
  end
end