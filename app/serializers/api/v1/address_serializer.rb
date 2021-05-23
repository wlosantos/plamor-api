class Api::V1::AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :number, :complement, :neighborhood,
             :city, :state, :country, :zipcode
end
