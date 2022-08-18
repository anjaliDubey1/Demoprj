class HomepagesController < ApplicationController
    def index
        if current_user.role == "admin" 
          redirect_to admins_path
        elsif current_user.role == "hr"
          redirect_to hr_index_path
        else 
          redirect_to employees_path
        end 
    end
end
