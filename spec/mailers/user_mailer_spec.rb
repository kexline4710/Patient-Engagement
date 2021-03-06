require 'spec_helper'

describe UserMailer do

	describe "#welcome_email" do
		let(:participant) { FactoryGirl.create(:participant) }
		let(:mail) { UserMailer.welcome_email(participant, "password") }

		it 'renders the receiver email' do
			expect(mail.to).to eq([participant.email])
		end

		it 'renders the subject' do
			expect(mail.subject).to eq('Welcome to SUBJECT1! Important password information in this email')
		end
	end

	describe '#notify_coordinator_new_question' do
		let(:coordinator) { FactoryGirl.create(:coordinator) }
		let(:mail) { UserMailer.notify_coordinator_new_question(coordinator) }

		it 'renders the receiver email' do
			expect(mail.to).to eq([coordinator.email])
		end

		it 'renders the subject' do
			expect(mail.subject).to eq('You have received a new question!')
		end
	end

  describe '#notify_participant_question_answered' do
    let(:participant) { FactoryGirl.create(:participant) }
    let(:mail) { UserMailer.notify_participant_question_answered(participant) }

    it 'renders the receiver email' do
      expect(mail.to).to eq([participant.email])
    end

    it 'renders the subject' do
      expect(mail.subject).to eq("You're question has been answered!")
    end
  end

end