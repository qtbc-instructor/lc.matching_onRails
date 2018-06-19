class UsersController < ApplicationController
  def index
  end
  
  def new
  end
  
  def update
  end
  
  def edit
  end    

  def check
    mail = params[:mail]
    password = params[:password]
    
    @user_mail = User.find_by(password_digest: 'password') 
    
  end
end
