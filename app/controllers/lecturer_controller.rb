class LecturerController < ApplicationController

  def index
    @freedays = Freeday.where(user_id: @usr)
    @newfreeday = Freeday.new
    @skills = Skill.where(user_id: @usr).order(:skill_master_id)
    skill_ids=[]
    @skills.each do |f|
      skill_ids.push(f.skill_master_id)
    end
    @addskills = SkillMaster.where.not(id: skill_ids)
    @score = Status.select("score").where(user_id: @usr.id, status_master_id: 5)
  end

  def create_free
    freeday_params = params.require(:freeday).permit(:user_id,:begin,:end)
    freeday = Freeday.new(freeday_params)
    if !freeday.begin.present? || !freeday.end.present? then
      flash[:notice] = '日付を入力してください'
    elsif freeday.begin < freeday.end then
      if freeday.save then
        flash[:notice] = '申請受付期間を登録しました'
      else
        flash[:notice] = '申請受付期間の登録に失敗しました'
      end
    else
      flash[:notice] = '初日〜最終日で入力してください'
    end
    redirect_to :action => "index"
  end

  def delete_free
    begin
      days = params.require(:freeday_id)
      if Freeday.destroy(days) then
        flash[:notice] = '受付期間を削除しました'
      else
        flash[:notice] = '受付期間の削除に失敗しました'
      end
    rescue
      flash[:notice] = '削除する受付期間が選択されていません'
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
    skill_id = params.require(:addskill)
    skill = Skill.new(user_id: @usr.id, skill_master_id: skill_id)
    if !skill.present?  then
      flash[:notice] = '登録するスキルが選択されていません'
    else
      if skill.save then
        flash[:notice] = 'スキルを登録しました'
      else
        flash[:notice] = 'スキルの登録に失敗しました'
      end
    end
    redirect_to :action => "index"
  end

end
