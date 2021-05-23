class Api::V1::CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :year_attained, :value_unit, :status
end
