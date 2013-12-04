require 'spec_helper'

describe ParticipantsFeeling do
  describe "associations" do
    it { should belong_to(:participant)}
  end
end
