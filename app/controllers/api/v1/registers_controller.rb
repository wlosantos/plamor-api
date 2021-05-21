class Api::V1::RegistersController < ApplicationController

  def index
    @registers = Register.all
    render json: @registers, status: :ok
  end

end
