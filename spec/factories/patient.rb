FactoryBot.define do
  factory :patient do
    full_name { Faker::Name.name }
    date_of_birth { Faker::Date.birthday(max_age: 90) }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.cell_phone }
  end
end