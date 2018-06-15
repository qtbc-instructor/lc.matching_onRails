class UsersController < ApplicationController

  before_action :check_logined , only: :view

  def view
    @msg = 'hello world!'
  end

  private
    def check_logined
      if session[:usr] then

        begin
          @usr = User.find(session[:usr])

        rescue ActiveRecord::RecordNotFound
          reset_session
        end
      end

      unless @usr
        flash[:referer] = request.fullpath
        redirect_to controller: :login, action: :index
      end
    end


end
