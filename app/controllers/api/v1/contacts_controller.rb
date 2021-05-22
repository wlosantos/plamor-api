class Api::V1::ContactsController < Api::V1::BaseV1Controller

  before_action :set_register, only: %i[ create ]
  before_action :set_contact, only: %i[ update destroy ]

  def create
    @contact = @register.contacts.build(contact_params)

    if @contact.save
      render json: @contact, status: :created
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render json: @contact, status: :ok
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @contact.destroy
      head 204
    else
      head 422
    end
  end

  private

  def set_register
    @register = Register.find(params[:register_id])
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:kind, :description, :status, :register_id)
  end
end
