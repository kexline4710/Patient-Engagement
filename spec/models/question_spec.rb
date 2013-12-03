require 'spec_helper'

describe Question do
  describe "associations" do
    it { should belong_to(:participant) }
    it { should have_one(:answer) }
    it { should have_one(:coordinator) }
  end
end
