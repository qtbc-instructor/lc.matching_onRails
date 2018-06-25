class CompanyController < ApplicationController
  def index
    @user = @usr
    @user_id = @user.id

    @Applyings = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 1).where("company_id = @user")
    @Approval = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 2).where("company_id = @user")
    @Denial = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 3).where("company_id = @user")
    @Score = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date, statuses.score').where("status_master_id = ?", 4).where("company_id = @user")
  end

  def destroy
    @status_id = Status.find(params[:id])
    @status_id.destroy
    respond_to do |status|
      status.html { redirect_to "/company", notice: '削除されました。'}
      status.json { head :no_content }
    end
  end

  def update2
    @status_state = Status.find(params[:id])
    @status_state.status_master_id = 4
    @status_state.save
  end

  def update
    logger.debug "=========================================="
    # 評価更新
    params.each do |key,value|
      if key[0,8] == "statusID"
        id = key[8,10].to_i
        s = Status.find(id)
        s.score = value
        s.status_master_id = 5
        s.save
        s.errors.messages
      end
    end
    logger.debug "=========================================="
    redirect_to "/company", action: :update
  end
end
