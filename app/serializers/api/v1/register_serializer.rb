class Api::V1::RegisterSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :rg, :contract, :birth, :plain,
             :status, :dependents

  def dependents
    object.sub_registers.map do |parent|
      {
        'id': parent.id,
        'name': parent.name,
        'cpf': parent.cpf,
        'rg': parent.rg,
        'contract': parent.contract,
        'birth': parent.birth,
        'status': parent.status
      }
    end
  end

end
