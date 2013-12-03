require 'spec_helper'

describe Coordinator do
  let(:coordinator) {FactoryGirl.create(:coordinator)}
  let(:participant) { FactoryGirl.create(:participant) }

  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
    it {should have_secure_password}
  end

  describe "#send_question_notification_email" do
  	it "sends the notification email" do
      participant.update_attribute(:coordinator_id, coordinator.id)
  		participant.coordinator.send_question_notification_email
			expect(ActionMailer::Base.deliveries.last.to).to eq([coordinator.email])
  	end
	end

  describe "associations" do
    it { should have_many(:participants) }
    it { should belong_to(:trial) }
  end

  describe "generate_token" do
    subject { coordinator }
    it "should change authenticity_token" do
      token = coordinator.authenticity_token
      coordinator.generate_token(:authenticity_token)
      expect(coordinator.authenticity_token).to_not eq(token)
    end
  end
end
