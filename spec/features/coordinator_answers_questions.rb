require 'spec_helper'

describe "the coordinator dashboard" do

  subject { page }

  describe "participants' questions should have answer button" do
    let(:coordinator) { FactoryGirl.create(:coordinator) }
    let(:participant) { FactoryGirl.create(:participant) }
    let(:question) { FactoryGirl.create(:question) }
    before do
      participant.questions << question
      coordinator.participants << participant
      visit root_path
      fill_in "Email",    with: coordinator.email
      fill_in "Password", with: coordinator.password
      click_button "Login"
    end
    it { should have_button("Answer") }
  end

  describe "answer button should bring up answer form" do
    let(:coordinator) { FactoryGirl.create(:coordinator) }
    let(:participant) { FactoryGirl.create(:participant) }
    let(:question) { FactoryGirl.create(:question) }
    before do
      participant.questions << question
      coordinator.participants << participant
      visit root_path
      fill_in "Email",    with: coordinator.email
      fill_in "Password", with: coordinator.password
      click_button "Login"
      click_button "Answer"
    end
    it { should have_content(question.title) }
  end

  describe "Coordinator answers question and submits" do
    let(:coordinator) { FactoryGirl.create(:coordinator) }
    let(:participant) { FactoryGirl.create(:participant) }
    let(:question) { FactoryGirl.create(:question) }
    # let(:answer) { FactoryGirl.create(:answer)}
    before do
      participant.questions << question
      coordinator.participants << participant
      visit root_path
      fill_in "Email",    with: coordinator.email
      fill_in "Password", with: coordinator.password
      click_button "Login"
      click_button "Answer"
      fill_in "Content", with: "get you some pills"
      click_button "Submit"
    end

    it { should redirect_to coordinator_path }
  end
end