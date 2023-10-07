require 'spec_helper'

RSpec.describe 'PatientMailer' do
  describe 'new_recommendation_email' do
    let(:patient) { FactoryBot.create(:patient) }
    let(:mail) { PatientMailer.with(patient: patient).new_recommendation_email }

    it 'renders the subject' do
      expect(mail.subject).to eql('You have a new recommendation')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([patient.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['notifications@example.com'])
    end

    it 'assigns @patient.full_name' do
      expect(mail.body.encoded.include?("You have a new recommendation, #{patient.full_name}")).to eq(true)
    end
  end
end
