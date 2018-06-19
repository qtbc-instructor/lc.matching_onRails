class UsersController < ApplicationController

  before_action :check_logined , only: :view

  def view
    @msg = 'hello world!'
  end

private
  def user_params
    params.require(:user).permit(:name, :tel, :mail_address, :password, :usertype)
  end

end
