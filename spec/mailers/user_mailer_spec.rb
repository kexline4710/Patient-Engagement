require 'spec_helper'

describe UserMailer do

	describe "#welcome_email" do
		let(:participant) { FactoryGirl.create(:participant) }
		let(:mail) { UserMailer.welcome_email(participant) }

		it 'renders the receiver email' do
			expect(mail.to).to eq([participant.email])
		end

		it 'renders the subject' do
			expect(mail.subject).to eq('Welcome to <NAME OF APP>! Important Password information in this email')
		end
	end

end