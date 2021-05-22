class Api::V1::AddressesController < Api::V1::BaseV1Controller

  before_action :set_register, only: %i[ create ]

  def create
    @address = @register.address.build(address_params)

    if @address.save
      render json: @address, status: :created
    else
      render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_register
    @register = Register.find(params[:register_id])
  end

  def address_params
    params.require(:address).permit(:street, :number, :complement,
    :neighborhood, :city, :state, :country, :zipcode)
  end

end
