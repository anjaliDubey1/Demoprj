class HrController < ApplicationController
  def index
    @hr = Hr.all
   end
 
   def show
     @hr =Hr.find(params[:id])
   end
 
   def new
     @hr = Hr.new
   end
 
   def create
     @admin =Admin.first
     @hr = @admin.hrs.new(hr_params)
     if @hr.save
       redirect_to hr_index_path
     else
       render :new
     end
   end
     def edit
       @hr = Hr.find(params[:id])
     end
   
     def update
       @hr = Hr.find(params[:id])
   
       if @hr.update(hr_params)
         redirect_to  hr_index_path
       else
         render :edit
       end
     end
     def destroy
       @hr = Hr.find(params[:id])
       @hr.destroy
   
       redirect_to hr_index_path
     end
   private
   def hr_params
     params.require(:hr).permit(:name,:phone_no,:age,:address)
   end
 
end
