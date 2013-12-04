require 'spec_helper'

describe SessionsController do
  let(:coordinator) {FactoryGirl.create(:coordinator)}
  let(:participant) {FactoryGirl.create(:participant)}

  context "#create" do

    describe "Participant" do
      it "should redirect to participant#show upon authentication" do
        post :create, :session => { :email => participant.email, :password => participant.password }

        response.should redirect_to "/participants/#{participant.authenticity_token}"
      end
      it "should not authenticate particpant's invalid password" do
        post :create, :session => { :email => participant.email, :password => "invalid" }
        response.should redirect_to login_path
      end
    end

    describe "Coordinator" do
      it "should redirect to coordinator#show upon authentication" do
        post :create, :session => {:email => coordinator.email, :password => coordinator.password }

        response.should redirect_to "/coordinators/#{coordinator.authenticity_token}"
      end
      it "should not authenticate coordinator's invalid password" do
        post :create, :session => {:email => coordinator.email, :password => "invalid"}
        response.should redirect_to login_path
      end
    end
  end
end