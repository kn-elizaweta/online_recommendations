require 'spec_helper'

describe "Recommendation" do
  let(:patient) { FactoryBot.create(:patient) }
  let(:consultation_request) { FactoryBot.create(:consultation_request, patient_id: patient.id) }
  it 'should not be valid' do
    recommendation = Recommendation.create(consultation_request_id: consultation_request.id)
    expect(recommendation).to_not be_valid
  end
end

