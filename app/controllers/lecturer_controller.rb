class LecturerController < ApplicationController

  def index
    @users = User.find(session[:usr])
    # user id
    @user = @users.id
    
    @application = Status.where(user_id: @user).where(status_master_id: 1)
    @plans = Status.where(user_id: @user).where(status_master_id: 2)
    @company_name = Company.find(@user)
    
    @freedays = Freeday.where(user_id: @user)
    @skills = Skill.where(user_id: @user)
    
  end

  def add_free
    @freeday = Freeday.new
  end
  
  def update    
    @users = User.find(session[:usr])
    @user = @users.id
    
    if params[:status].match(/2,*/) then
      
    elsif  params[:status].match(/3,*/) then
      
    end
    
    session[:test] = "updateメソッドの実行"
    redirect_to action: :index
      
      
     #user = Status.find(@user)
    #user.status_master_id = 2
    #user.save
  
    
  end

end
