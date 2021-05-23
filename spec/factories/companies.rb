FactoryBot.define do
  factory :company do
    name { 'Plamor' }
    year_attained { "2021-05-22 21:23:05" }
    value_unit { "9.99" }
    status { 'active' }
    user
  end
end
