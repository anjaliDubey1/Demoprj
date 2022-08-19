class EmployeesController < ApplicationController
  load_and_authorize_resource
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  def index
    @employee =Employee.all
  end
  def show
  end
  def new
    @employee = Employee.new
  end
  def create
    @admin =Admin.first
    @employee = @admin.Employees.new(employee_params)
    if @employee.save
      redirect_to employees_path
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @employee.update(employee_params)
      redirect_to  employees_path
    else
      render :edit
    end
  end
  def destroy
    @employee.destroy
    redirect_to employees_path
  end
  private
  def set_employee
    @employee = Employee.find(params[:id])
  end
  def employee_params
    params.require(:employee).permit(:name,:email,:phone_no,:age,:address)
  end
 end
    