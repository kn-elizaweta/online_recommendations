class ConsultationRequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create 
    consultation_request = ConsultationRequest.create!(consultation_request_params)
    render json: consultation_request
    end

    def recommendations
      recommendation = Recommendation.create!(recommendation_params)
      render json: recommendation
    end
  
    private
    
    def recommendation_params
      { consultation_request_id: params[:id], recommendation_text: params[:text] }
    end

    def consultation_request_params
      params.require(:consultation_request).permit(:patient_id, :query_text)
    end
end