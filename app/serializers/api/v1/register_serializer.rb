class Api::V1::RegisterSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :rg, :contract, :birth, :plain,
             :status, :dependents, :address, :contacts

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

  def address
    object.address.map do |ad|
      {
        'id': ad.id,
        'street': ad.street,
        'number': ad.number,
        'complement': ad.complement,
        'neighborhood': ad.neighborhood,
        'city': ad.city,
        'state': ad.state,
        'country': ad.country,
        'zipcode': ad.zipcode
      }
    end
  end

  def contacts
    object.contacts.map do |contact|
      {
        'id': contact.id,
        'kind': contact.kind,
        'description': contact.description,
        'status': contact.status
      }
    end
  end

end
