class ConsultationRequest < ApplicationRecord
  belongs_to :patient
  has_one :recommendation
  validates :query_text, presence: true
end
