class LecturerController < ApplicationController

  def index
    @users = User.find(session[:usr])
    @user = @users.id
    
    #@company_name = Company.find_by(user_id: @user)
    
    @user_status = Status.find_by(user_id: @user)
    if @user_status.status_master_id == 1 then
      @company_name = Company.find_by(user_id: @user)
    end
      
    @freedays = Freeday.where(user_id: @user)
    @skills = Skill.where(user_id: @user)
    
    
  end

  def add_free
    @freeday = Freeday.new
  end

end
