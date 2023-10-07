require 'rails_helper'

RSpec.describe "ConsultationRequests", type: :request do
describe "POST /:request_id/recommendations" do
  let!(:consultation_request) { FactoryBot.create(:consultation_request) }
  it 'creates a new Recommendation' do 
    post "/consultation_requests/#{consultation_request.id}/recommendations", params: { 'text' => 'test' }
    expect(ConsultationRequest.last.recommendation.recommendation_text).to eq('test')
    end
  end
end