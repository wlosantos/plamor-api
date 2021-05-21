class Api::V1::RegistersController < ApplicationController

  before_action :authenticate_user!

  before_action :set_register, only: %i[ show ]

  def index
    @registers = Register.all
    render json: @registers, status: :ok
  end

  def show
    render json: @register, status: :ok
  end

  def create
    @register = current_user.registers.build(register_params)

    if @register.save
      render json: @register, status: :created
    else
      render json: { errors: @register.errors.full_messages }, status: 422
    end
  end

  private

  def set_register
    @register = Register.find(params[:id])
  end

  def register_params
    params.require(:register).permit(:name, :contract, :cpf, :rg,
    :birth, :plain, :status)
  end

end
