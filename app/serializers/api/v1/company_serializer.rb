class Api::V1::CompanySerializer < ActiveModel::Serializer
  attributes :id, :year_attained, :value_unit, :status
end
