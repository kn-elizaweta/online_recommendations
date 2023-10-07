require 'rails_helper'

RSpec.describe "Patients", type: :request do
  describe "GET /analyze" do
    let!(:patient) { FactoryBot.create(:patient) }
    it "analyze" do
      get "/patients/#{patient.id}/analyze"
      expect(JSON.parse(body)["urinalysis"]).to eq("bacteria were detected")
    end
  end
end