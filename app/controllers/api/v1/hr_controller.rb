class Api::V1::HrController < Api::V1::ApiController
    skip_before_action :verify_authenticity_token
    def index
      @hrs = Hr.all
    end
    def show
      @hr =Hr.find(params[:id])
    end
    def create
        @admin =Admin.first
        @hr = @admin.hrs.new(hr_params)
        if @hr.save
            render json: {status:"Success",message:"successfully saved",data:@hr},status: :ok
        else
            render json: {status:"error",message:"not saved",data:@hr.errors}
        end   
    end
    def update
        @hr = Hr.find(params[:id])
        if @hr.update(hr_params)
            render json: {status:"Success",message:" updated successfully ",data:@hr},status: :ok
        else
            render json: {status:"error",message:"not update",data:@hr.errors}
        end
    end
    def destroy
        @hr =Hr.find(params[:id]) 
        if @hr.destroy
            redirect_to api_v1_hr_index_path
        end
      
    end

    private
    def hr_params
        params.permit(:name,:phone_no,:age,:address)
    end
end