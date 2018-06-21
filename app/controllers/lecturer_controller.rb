class LecturerController < ApplicationController

  def index
    @users = User.find(1)
    @user = @users.id
    @freedays = Freeday.where(user_id: @user)
    @skills = Skill.where(user_id: @user)
    @freeday = Freeday.new
  end

  def create_free
    freeday_params = params.require(:freeday).permit(:user_id,:begin,:end)
    freeday = Freeday.new(freeday_params)
    if !freeday.begin.present? || !freeday.end.present? then
      flash[:notice] = '日付を入力してください'
    elsif freeday.begin < freeday.end then
      if freeday.save then
        flash[:notice] = '日付を登録しました'
      else
        flash[:notice] = '日付の登録に失敗しました'
      end
    else
      flash[:notice] = '初日〜最終日で入力してください'
    end
    redirect_to :action => "index",:id => freeday.user_id
  end

  def delete_free
    if !params(:freeday_id).present? then
      flash[:notice] = '登録日が選択されていません'
    else
      days = params.require(:freeday_id)
      if Freeday.destroy(days) then
        flash[:notice] = '日付を削除しました'
      else
        flash[:notice] = '削除に失敗しました'
      end
    end
    @users = User.find(1)
    @user = @users.id
    redirect_to :action => "index",:id => @user
  end

  def set_user
    @users = User.find(params[:id])
    @user = @users.id
  end

end
