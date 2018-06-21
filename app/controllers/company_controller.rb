class CompanyController < ApplicationController
  def index
    @Applying = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 1)
    @Approval = Status.joins(:user, :skill_master).select('users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 2)
    @Denial = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 3)
    @Score = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 4)
  end

  def destroy
    @Applying = Status.find(params[:id])
    @Denial = Status.find(params[:id])
    @Applying.destroy
    @Denial.destroy
    redirect_to :company

    # とりあえず残す
    # status = Status.find(params[:id])
    # status.all = Status.find_by_all
    # status.destroy
    # redirect_to company_path

    # destroyをクラスメソッドとして呼び出し
     # Satus.destroy(params[:id])

    # deleteメソッド
    #Book.delete(params[:id])
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
