class LoginController < ApplicationController
#  skip_before_action :check_logined
  #before_action :logout , only: :auth

#ログインボタンのクリック時に実行されるアクション
 def auth
   usr_mail = User.find_by(mail_address: params[:mail_address])
   usr_pass = User.find_by(pass: params[:pass])

   if usr_mail && usr_pass then
     reset_session
     session[:usr] = usr_mail.id
     redirect_to params[:referer]
   else
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
