require 'spec_helper'

describe "the participant dashboard" do

  subject { page }

  describe "the participant checks status of pending questions" do

    describe "there is one answered question" do
       let(:participant) { FactoryGirl.create(:participant) }
      let(:question) { FactoryGirl.create(:question)}
      let(:answer) { FactoryGirl.create(:answer) }
      let(:coordinator) { FactoryGirl.create(:coordinator) }
      before do
        answer.coordinator_id = coordinator.id
        answer.question = question
        answer.save
        visit root_path
        fill_in "Email",    with: participant.email
        fill_in "Password", with: participant.password
        click_button "Login"
      end
      it { should have_content("You have answered questions!") }
    end

    describe "the participant views question" do
      let(:participant) { FactoryGirl.create(:participant) }
      let(:question) { FactoryGirl.create(:question)}
      let(:answer) { FactoryGirl.create(:answer) }
      let(:coordinator) { FactoryGirl.create(:coordinator) }
      before do
        answer.coordinator_id = coordinator.id
        answer.question = question
        answer.save
        visit root_path
        fill_in "Email",    with: participant.email
        fill_in "Password", with: participant.password
        click_button "Login"
        find(:link, "You have answered questions!").click
      end
      it { should have_content(question.content)}
    end

    describe "the participant views question" do
      let(:participant) { FactoryGirl.create(:participant) }
      let(:question) { FactoryGirl.create(:question)}
      let(:answer) { FactoryGirl.create(:answer) }
      let(:coordinator) { FactoryGirl.create(:coordinator) }
      before do
        answer.coordinator_id = coordinator.id
        answer.question = question
        answer.save
        visit root_path
        fill_in "Email",    with: participant.email
        fill_in "Password", with: participant.password
        click_button "Login"
        find(:link, "You have answered questions!").click
        find(:xpath, "//a[@href='/']").click
      end
      it { should_not have_content("You have answered questions!") }
    end
  end
end
