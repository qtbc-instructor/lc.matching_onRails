class UsersController < ApplicationController

  before_action :check_logined , only: :view

  #samplePage
  def view
    @msg = 'hello world!'
  end

  #------------------------------------
  #userに新規レコード追加するための器を生成
  #------------------------------------
  def new
    @user = User.new()
    @user.usertype=params[:usertype]

    if @user.usertype == 1 then
      @company = @user.build_company
    end

  end

  #------------------------------------
  #userに新規レコードを追加
  #------------------------------------
  def create
    #入力値によるモデルの再構築
    @user = User.new(user_params)

    #name:'back'がきたら、:newに行く
    if params[:back] == '戻る' then
      render :action => :new
      return
    end
    #データの保存と結果に対する処理を分岐する
      if @user.save then
        #成功したら、ログイン画面にメッセージ
        redirect_to '/', notice: "新規登録完了しました!"
        # flash[:notice] = '新規登録完了しました!'
      else
        #失敗したら、登録フォームを再描画
        logger.debug "=============="
        logger.debug @user.errors.to_json
        logger.debug "=============="
        logger.debug @user.to_json
        render :action => :new
      end
  end

  #------------------------------------
  #入力値の確認のアクション
  #------------------------------------
  def confirm
    @user = User.new(user_params)
    logger.debug "====================================="
    logger.debug @user.company.to_json
    logger.debug "====================================="

    #バリデーション
    return if @user.valid?
    #失敗したらnewへ遷移
    render :new
  end

private
  #------------------------------------
  #ポストデータを取得
  #------------------------------------
  def user_params
    params.require(:user).permit!
    #params.require(:user).permit(:name, :tel, :mail_address, :password , :usertype , company_attribute:[:companyname])
  end

end
