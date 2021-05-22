class Api::V1::AddressesController < Api::V1::BaseV1Controller

  before_action :set_register, only: %i[ create ]
  before_action :set_address, only: %i[ update destroy ]

  def create
    @address = @register.address.build(address_params)

    if @address.save
      render json: @address, status: :created
    else
      render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @address.update(address_params)
      render json: @address, status: :ok
    else
      render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @address.destroy
      head 204
    else
      head 422
    end
  end

  private

  def set_register
    @register = Register.find(params[:register_id])
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :number, :complement,
    :neighborhood, :city, :state, :country, :zipcode)
  end

end
