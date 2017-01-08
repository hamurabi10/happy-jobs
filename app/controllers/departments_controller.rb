class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
    @current_user = User.find(session[:current_user])
  end

  def create
    department = Department.new(department_params)
    respond_to do |format|
      if department.save
        format.html {redirect_to departments_url, notice: 'Departamento creado.'}
      else
        format.html {redirect_to departments_url, notice: 'Hubo un error al guardar el departamento'}
      end
    end
  end

  private
    def department_params
      params.require(:department).permit(:name, :description, :color)
    end
end
