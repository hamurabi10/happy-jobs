class CompaniesController < ApplicationController
  before_action :set_department, only: [:show]

  def index
    @companies = Company.all
  end

  def create
    company = Company.new(company_params)

    respond_to do |format|
      if company.save
        format.html {redirect_to companies_url, notice: 'La empresa se ha creado.'}
      else
        format.html {redirect_to companies_url, notice: 'Hubo un error al guardar la empresa.'}
      end
    end
  end

  def show
    @profiles = Profile.where(company_id: @company.id)
    session[:current_company] = @company.id
  end

  def status
    if params[:id] && params[:status]
      respond_to do |format|
        company = Company.find(params[:id])

        if company.update(status: params[:status])
          format.html {redirect_to companies_url, notice: 'Empresa actualizada.'}
        else
          format.html {redirect_to companies_url, notice: 'Hubo un error al actualizar.'}
        end
      end
    else
      redirect_to companies_url
    end
  end

  private
   def company_params
     params.require(:company).permit(:name, :logo, :description, :phone, :email)
   end

   def set_department
     @company = Company.find(params[:id])
   end
end
