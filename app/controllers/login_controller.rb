class LoginController < ApplicationController
  skip_before_action :check_logined

  def index
  end

#[ログイン]ボタンのクリック時に実行されるアクション
  def auth
    # 入力値に従ってユーザー情報を取得
    usr = User.find_by(mail_address: params[:mail_address])
    # ユーザー情報が存在し、認証に成功したら
     if usr && usr.authenticate(params[:password]) then
      # idをセッションに設定し、要求ページにリダイレクト
       reset_session
      session[:usr] = usr.id
      # usertypeが講師だったらpathは/lecturer
      if usr.usertype == 0 then
        redirect_to '/lecturer'
        # usertypeが企業だったらpathは/company
      elsif usr.usertype == 1 then
        redirect_to '/company'
      end
     else
     # 失敗したらflash[:referer]を再セットし、ログインページを再描画
       flash.now[:referer] = params[:referer]
       @error = 'メールアドレス／パスワードが間違っています。'
       render 'index'
     end
  end

#ログアウト
 def logout
   reset_session
   redirect_to '/'
 end
end
