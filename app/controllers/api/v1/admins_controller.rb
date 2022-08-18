class Api::V1::AdminsController < Api::V1::ApiController
    skip_before_action :verify_authenticity_token
    def index
      @admins = Admin.all
    end
    def show
      @admin =Admin.find(params[:id])
    end
    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            render json: {status:"Success",message:"successfully saved",data:@admin},status: :ok
        else
            render json: {status:"error",message:"not saved",data:@admin.errors}
        end   
    end
    def update
        @admin = Admin.find(params[:id])
        if @admin.update(admin_params)
            render json: {status:"Success",message:" updated successfully ",data:@admin},status: :ok
        else
            render json: {status:"error",message:"not update",data:@admin.errors}
        end
    end
    def destroy
        @admin =Admin.find(params[:id]) 
        if @admin.destroy
            redirect_to api_v1_admins_path 
        end
        
    end

    private
    def admin_params
        params.permit(:name,:phone_no,:age,:address)
    end
end