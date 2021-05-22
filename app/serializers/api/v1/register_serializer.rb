class Api::V1::RegisterSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :rg, :contract, :birth, :plain,
             :status

end
