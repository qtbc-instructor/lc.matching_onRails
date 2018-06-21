class CompanyController < ApplicationController
  def index
    @Applyings = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 1)
    @Approval = Status.joins(:user, :skill_master).select('users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 2)
    @Denial = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 3)
    @Score = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 4)
  end

  def destroy
    @Applying = Status.find(params[:id])
    @Denial = Status.find(params[:id])
    @Applying.destroy
    @Denial.destroy

    redpond_to do |status|
      status.html { redirect_to Applyings_url, notice: '削除されました。'}
      status.json { head :no_content }
    end
  end

  # def update
  #   user = Satus.find(params[:status_master_id])
  #   user.save
  #   render :json => user
  # end

  def update
    status = Status.find(params[:id])
    status.score = Status.find_by(score: params[:score])
    status.save
  end

end
