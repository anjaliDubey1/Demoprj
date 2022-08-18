class HrController < ApplicationController
  load_and_authorize_resource
  before_action :set_hr, only: [:show, :edit, :update, :destroy]
  def index
    @hr = Hr.all
  end
  def show
    
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
  end
  def update
    if @hr.update(hr_params)
      redirect_to  hr_index_path
    else
      render :edit
    end
  end
  def destroy
    @hr.destroy
    redirect_to hr_index_path
  end
  private
  def set_hr
    @hr = Hr.find(params[:id])
  end
  def hr_params
    params.require(:hr).permit(:name,:phone_no,:age,:address)
  end
 end
