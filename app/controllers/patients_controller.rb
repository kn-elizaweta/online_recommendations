class PatientsController < ApplicationController
  #GET /patients/:patient_id/recommendations - 
  #получение списка рекомендаций для конкретного пациента
  def recommendations
    recommendations = Recommendation.joins(:consultation_request)
                                    .where(consultation_requests: { patient_id: params[:id] })
    render json: recommendations
  end
  
  def analyze
    render json: ExternalIntegrations::GetAnalyses.new(params[:id]).call
  end
end