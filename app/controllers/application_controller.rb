class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_logined

#認証済みかどうかを判定するcheck_loginedフィルターを定義
private
  def check_logined
    #セッション情報:usr(id値)が存在するか
    if session[:usr] then
      #存在したらusersテーブルを検索し、ユーザー情報を取得
      begin
        @usr = User.find(session[:usr])
        #存在しなかったら不正なユーザーとみなし、セッションを破棄
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end
    #ユーザー情報を取得できなかったらログインページへ(login#index)
    unless @usr
      flash[:referer] = request.fullpath
      redirect_to controller: :login, action: :index
    end
  end
end
