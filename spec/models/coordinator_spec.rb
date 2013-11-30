require 'spec_helper'

describe Coordinator do
  let(:coordinator) {FactoryGirl.build(:coordinator)}

  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
    it {should have_secure_password}
  end
end