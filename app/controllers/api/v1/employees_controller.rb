class Api::V1::EmployeesController < Api::V1::ApiController
    skip_before_action :verify_authenticity_token
    before_action :set_employee, only: [:show, :update, :destroy]
    def index
      @employees = Employee.all
    end
    def show
     
    end
    def create
        @admin =Admin.first
        @employee = @admin.Employees.new(employee_params)
        if @employee.save
            render :create
        else
            render json: {status:"error",message:"not saved",data:@employee.errors}
        end   
    end
    def update
        if @employee.update(employee_params)
            render :update
        else
            render json: {status:"error",message:"not update",data:@employee.errors}
        end
    end
    def destroy
        if @employee.destroy
            redirect_to api_v1_employees_path
        end
    end
    private
    def set_employee
        @employee = Employee.find(params[:id])
    end
    def employee_params
        params.permit(:name,:email,:phone_no,:age,:address)
    end
end