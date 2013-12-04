require 'spec_helper'

describe "the participant dashboard" do

  let(:participant) { FactoryGirl.create(:participant) }
  let(:question) { FactoryGirl.create(:question)}
  let(:coordinator) { FactoryGirl.create(:coordinator) }
  let(:answer) { FactoryGirl.create(:answer) }

  before(:each) do
    answer.coordinator_id = coordinator.id
    answer.save
    question.answer = answer
    question.save
    participant.questions << question
    participant.coordinator = coordinator
    participant.save


    visit root_path
    fill_in "Email",    with: coordinator.email
    fill_in "Password", with: coordinator.password
    click_button "Login"
  end

  it "displays subject number in table" do
    page.should have_content(participant.subject_number)
  end

  it "participant subject number should hotlink to archive view" do
    find(:link, participant.subject_number.to_s).click
    page.should have_content(participant.questions[0].title)
  end
end
