class HomepagesController < ApplicationController
    def index
        if current_user.role == "Admin" 
          redirect_to admins_path
        elsif current_user.role == "Hr"
          redirect_to hr_index_path
        else 
          redirect_to employees_path
        end 
    end
end
