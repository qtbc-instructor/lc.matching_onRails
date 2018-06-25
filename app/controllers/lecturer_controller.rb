class LecturerController < ApplicationController

  def index
    # @users = User.find(12)
    @users = @usr
    @user = @users.id
    @freedays = Freeday.where(user_id: @user)
    @skills = Skill.where(user_id: @user)
    @freedays = Freeday.where(user_id: @usr)
    @skills = Skill.where(user_id: @usr)
    @addskills = @skills
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
    redirect_to :action => "index"
  end

  def delete_free
    @users = @usr
    # @users = User.find(12)
    @user = @users.id
    if Freeday.destroy(checked_free)
      flash[:notice] = '日付を削除しました'
    else
      flash[:notice] = '削除に失敗しました'
    begin
      days = params.require(:freeday_id)
      if Freeday.destroy(days) then
        flash[:notice] = '登録日を削除しました'
      else
        flash[:notice] = '登録日の削除に失敗しました'
      end
    rescue
      flash[:notice] = '登録日が選択されていません'
    end
    redirect_to :action => "index"
  end

  def delete_skill
    begin
      skills = params.require(:skill_id)
      if Skill.destroy(skills) then
        flash[:notice] = '登録スキルを削除しました'
      else
        flash[:notice] = '登録スキルの削除に失敗しました'
      end
    rescue
      flash[:notice] = '削除するスキルが選択されていません'
    end
    redirect_to :action => "index"
  end

  def add_skill
    begin
      skills = params.require(:skill).permit(:user_id,:skill_id)
      if Skill.save(skills) then
        flash[:notice] = 'スキルを登録しました'
      else
        flash[:notice] = 'スキルの登録に失敗しました'
      end
    rescue
      flash[:notice] = '登録するスキルが選択されていません'
    end
    redirect_to :action => "index"
  end



end
