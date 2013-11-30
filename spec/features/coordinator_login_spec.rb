require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "login page" do
    before { visit root_path }
    it { should have_content('Email') }
  end

  describe "login attempt" do
    let(:coordinator) { FactoryGirl.create(:coordinator) }
    before(:each) do
      visit root_path
    end
    describe "coordinator enters email"
    before do
      fill_in "Email", with: coordinator.email
      click_button "Login"
    end
    it { should have_content('Welcome') }

  end
end