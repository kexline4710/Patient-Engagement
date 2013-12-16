require "spec_helper"

describe ParticipantsController do
  let(:coordinator) {FactoryGirl.create(:coordinator)}
  let(:participant) {FactoryGirl.create(:participant)}
  let(:question) { FactoryGirl.create(:question)}

  #context "#show" do

    describe "Participant" do
      it "should set @questions to five_recent_questions" do
        get :show, :id => participant.id
        # debugger
        assigns(:questions).should eq(question)
      end
      # it "should not authenticate particpant's invalid password" do
      #   post :create, :session => { :email => participant.email, :password => "invalid" }
      #   response.should redirect_to login_path
      # end
    end

    # describe "Coordinator" do
    #   it "should redirect to coordinator#show upon authentication" do
    #     post :create, :session => {:email => coordinator.email, :password => coordinator.password }

    #     response.should redirect_to "/coordinators/#{coordinator.authenticity_token}"
    #   end
    #   it "should not authenticate coordinator's invalid password" do
    #     post :create, :session => {:email => coordinator.email, :password => "invalid"}
    #     response.should redirect_to login_path
    #   end
    # end
  #end
end
