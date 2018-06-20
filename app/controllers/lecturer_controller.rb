class LecturerController < ApplicationController

    # before_action :set_user, onry:[:index,:freeday_params]

  def index
    @users = User.find(params[:id])
    @user = @users.id
    @freedays = Freeday.where(user_id: @user)
    @skills = Skill.where(user_id: @user)
    @freeday = Freeday.new
  end

  def createfree
    @freeday = Freeday.new(freeday_params)
    if @freeday.save
      render :action => "index" , notice: '日付を登録しました'
    else
      redirect_to :action => "index", notice: '日付を登録できませんでした'
    end
  end

  def deletefree
    check_data = params[:id]
    if Freeday.destroy(check_data)
      redirect_to '/:id', notice: '日付削除完了'
    else
      redirect_to '/:id', notice: '日付削除失敗'
    end
  end

  def freeday_params
    params.require(:freeday).permit(:user_id,:begin,:end)
  end

  def set_user
    @users = User.find(params[:id])
    @user = @users.id
  end

end
