class Recommendation < ApplicationRecord
  belongs_to :consultation_request
  validates :recommendation_text, presence: true
  after_create :send_recommendation_email

  def send_recommendation_email
     patient = consultation_request.patient
     PatientMailer.with(patient: patient).new_recommendation_email.deliver_now
  end
end
