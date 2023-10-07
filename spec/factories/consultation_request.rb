FactoryBot.define do
  factory :consultation_request do
    query_text { Faker::Book.title }
    association(:patient)
  end
end