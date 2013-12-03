require 'spec_helper'

describe Question do
  describe "associations" do
    it { should belong_to(:participant) }
    it { should have_one(:answer) }
    it { should have_one(:coordinator) }
  end

  describe "coordinator_name" do
    let(:question) {FactoryGirl.create(:question) }
    let(:answer) { FactoryGirl.create(:answer) }
    let(:coordinator) {FactoryGirl.create(:coordinator)}

    it "should equal coordinator.name" do
      answer.update_attributes(question_id: question.id, coordinator_id: coordinator.id)
      expect(question.coordinator_name).to eq(coordinator.first_name)
    end
  end
end
