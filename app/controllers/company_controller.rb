class CompanyController < ApplicationController
  def index
    @Applyings = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 1)
    @Approval = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 2)
    @Denial = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 3)
    @Score = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date, statuses.score').where("status_master_id = ?", 4)

  end

  def set_user
    @user = User.find(params[:id])
    @usr = @user.id
  end

  def destroy
    @status_id.destroy
    respond_to do |status|
      status.html { redirect_to "/company", notice: '削除されました。'}
      status.json { head :no_content }
    end
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
      else
        id = key[0,10].to_i
        h = Status.find(id)
        h.status_master_id = 4
        h.save
      end
    end

    logger.debug "=========================================="
    redirect_to "/company", action: :update
  end
end
