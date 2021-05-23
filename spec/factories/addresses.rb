FactoryBot.define do
  factory :address do
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    neighborhood { Faker::Address.community }
    city { "Rio de Janeiro" }
    state { "RJ" }
    country { 'BR' }
    zipcode { Faker::Address.zip_code }
    register
  end
end
