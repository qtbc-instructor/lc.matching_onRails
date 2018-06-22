class LecturerController < ApplicationController

  def index
    @users = User.find(session[:usr])
    @user = @users.id
    
    #@status_master = Status.find(status_master_id: @user)
    
    # if @status_master == 1 then
    #   @companys = Company.where(user_id: @status_master)
    #   @date = Status.where(user_id: @status_master)
    # end
    
    
    @freedays = Freeday.where(user_id: @user)
    @skills = Skill.where(user_id: @user)
    
    
  end

  def add_free
    @freeday = Freeday.new
  end

end
