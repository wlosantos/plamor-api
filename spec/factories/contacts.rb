FactoryBot.define do
  factory :contact do
    kind { 'cell' }
    description { '21 96981-2737' }
    status { 'active' }
    register
  end
end
