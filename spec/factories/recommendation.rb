FactoryBot.define do
  factory :recommendation do
    recommendation_text { Faker::Quote.famous_last_words }
    association(:consultation_request)
  end
end
