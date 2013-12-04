require 'spec_helper'

describe "the participant dashboard" do

  subject { page }

  describe "the participant checks status of pending questions" do
    let(:feeling) { FactoryGirl.create(:feeling)}
    let(:participant) { FactoryGirl.create(:participant) }
    let(:question) { FactoryGirl.create(:question)}
    let(:answer) { FactoryGirl.create(:answer) }
    let(:coordinator) { FactoryGirl.create(:coordinator) }
    before(:each) do
      answer.coordinator_id = coordinator.id
      answer.question = question
      answer.save
      participant.feeling = feeling
      visit root_path
      fill_in "Email",    with: participant.email
      fill_in "Password", with: participant.password
      click_button "Login"

      describe "there is one answered question" do
        it { should have_content("You have answered questions!") }
      end

      describe "the participant views question" do

        find(:link, "You have answered questions!").click
        it { should have_content(question.content)}
      end

      describe "the participant views question" do

        find(:link, "You have answered questions!").click
        find(:xpath, "//a[@href='/']").click
        it { should have_content("Welcome")}
      end
    end
  end
end

#test whether feeling will show or not depending on feeling being set

#feature/scenario
