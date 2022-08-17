class AdminsController < ApplicationController
  def index
  @admin =Admin.all
  end

  def show
   @admin =Admin.find(params[:id])
  end

  def new
   @admin = Admin.new
  end

  def create
    byebug
   @admin = Admin.new(admin_params)
   if @admin.save
     redirect_to admins_path
   else
     render :new
   end
 end
 def edit
  @admin = Admin.find(params[:id])
end

def update
  @admin = Admin.find(params[:id])

  if @admin.update(admin_params)
    redirect_to admins_path
  else
    render :edit
  end
end
def destroy
  @admin = Admin.find(params[:id])
  @admin.destroy

  redirect_to admins_path
end
 private
  def admin_params
   params.require(:admin).permit(:name,:phone_no,:age,:address)
  end
end