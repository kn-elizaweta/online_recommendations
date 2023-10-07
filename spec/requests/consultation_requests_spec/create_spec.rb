require 'rails_helper'

RSpec.describe "ConsultationRequests", type: :request do
  describe "POST /create" do
    let!(:patient) { FactoryBot.create(:patient) }
    it 'creates a new ConsultationRequest' do
      post '/consultation_requests', params: {'consultation_request' => {'patient_id' => patient.id,
                                              'query_text' => 'test'} }
      expect(ConsultationRequest.last.query_text).to eq('test')
    end
  end
end