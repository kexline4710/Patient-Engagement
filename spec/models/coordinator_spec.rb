require 'spec_helper'

describe Coordinator do
  let(:coordinator) {FactoryGirl.build(:coordinator)}

  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
    it {should have_secure_password}
  end

  describe "associations" do
    it { should have_many(:participants) }
    it { should belong_to(:trial) }
  end

  describe "#send_question_notification_email" do
  	it "sends the notification email" do
  		coordinator.send_question_notification_email
			expect(ActionMailer::Base.deliveries.last.to).to eq([coordinator.email])
  	end
	end
end
