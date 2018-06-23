class LecturerController < ApplicationController

  def index
    @users = User.find(session[:usr])
    # user id
    @user = @users.id
      
    
      
    # @user_status = Status.where(user_id: @user)
    @user_status = Status.where(user_id: @user)
    
    
    
    # if @user_status.status_master_id == 1 then
    #   @application = Company.find_by(user_id: @user)
    # elsif @user_status.status_master_id == 2 then 
    #   @company_name = Company.find_by(user_id: @user)
    # end
      
    @freedays = Freeday.where(user_id: @user)
    @skills = Skill.where(user_id: @user)
    
  end

  def add_free
    @freeday = Freeday.new
  end
  
  def update    
    @users = User.find(session[:usr])
    @user = @users.id
    user = Status.find(@user)
    user.status_master_id = 2
    user.save
    
    session[:test] = "updateメソッドの実行"
    redirect_to action: :index
    
  end

end
