module ExternalIntegrations
  class GetAnalyses
    def initialize(patient_id)
      @patient_id = patient_id
    end

    def call
      if Rails.env == "production"
        response = Faraday.get("https://www.api.crie.ru/analyses/#{@patient_id}")
      else 
        { complete_blood_count: "normal",
          urinalysis: "bacteria were detected",
          stool_test: "mucus was detected" }
      end
    end
  end
end