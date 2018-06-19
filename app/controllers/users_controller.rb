class UsersController < ApplicationController
<<<<<<< HEAD
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
    
    @user_mail = User.where(password_digest: 'password') 
    
  end
=======

  before_action :check_logined , only: :view

  def view
    @msg = 'hello world!'
  end

private
  def user_params
    params.require(:user).permit(:name, :tel, :mail_address, :password, :usertype)
  end

>>>>>>> 55770998331d25d25c98a87620ff3ee67cd666bf
end
