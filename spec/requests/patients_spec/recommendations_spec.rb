require 'rails_helper'

RSpec.describe "Patients", type: :request do
  describe "GET /recommendations" do
    let!(:patient) { FactoryBot.create(:patient) }
    it "recommendations" do
      consultation_request = FactoryBot.create(:consultation_request, patient_id: patient.id)
      consultation_request2 = FactoryBot.create(:consultation_request, patient_id: patient.id)
      consultation_request3 = FactoryBot.create(:consultation_request, patient_id: patient.id)
      recommendation = FactoryBot.create(:recommendation, consultation_request_id: consultation_request.id)
      recommendation2 = FactoryBot.create(:recommendation, consultation_request_id: consultation_request2.id)
      recommendation3 = FactoryBot.create(:recommendation, consultation_request_id: consultation_request3.id)
      get "/patients/#{patient.id}/recommendations"
     expect(JSON.parse(body).count).to eq(3)
    end
  end
end