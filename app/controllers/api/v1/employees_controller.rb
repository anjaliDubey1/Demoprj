class Api::V1::EmployeesController < Api::V1::ApiController
    skip_before_action :verify_authenticity_token
    def index
      @employees = Employee.all
    end
    def show
      @employee =Employee.find(params[:id])
    end
    def create
        @admin =Admin.first
        @employee = @admin.Employees.new(employee_params)

        if @employee.save
            render json: {status:"Success",message:"successfully saved",data:@employee},status: :ok
        else
            render json: {status:"error",message:"not saved",data:@employee.errors}
        end   
    end
    def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            render json: {status:"Success",message:" updated successfully ",data:@employee},status: :ok
        else
            render json: {status:"error",message:"not update",data:@employee.errors}
        end
    end
    def destroy
        @employee =Employee.find(params[:id]) 
        if @employee.destroy
            redirect_to api_v1_employees_path
        end
    end

    private
    def employee_params
        params.permit(:name,:phone_no,:age,:address)
    end
end