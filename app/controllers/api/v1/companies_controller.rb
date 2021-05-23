class Api::V1::CompaniesController < Api::V1::BaseV1Controller

  before_action :set_company, only: %i[ show update destroy ]

  def show
    render json: @company, status: :ok
  end

  def create
    @company = current_user.companies.build(company_params)

    if @company.save
      render json: @company, status: :created
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
      render json: @company, status: :ok
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @company.destroy
      head 204
    else
      head 422
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :year_attained, :value_unit, :status)
  end

end
