FactoryBot.define do
  factory :register do
    name { Faker::Name.unique.name }
    contract { Faker::Date.between(from: '1990-01-01', to: '2020-12-31') }
    cpf { CPF.generate }
    rg { "444.444" }
    birth { Faker::Date.between(from: '1950-01-01', to: '1990-12-31') }
    plain { %i[ holder dependent ].sample }
    parent_id { nil }
    status { %i[ active inactive ].sample }
    user
  end
end
