class CompanyController < ApplicationController
  def index
    @Applying = Status.joins(:user, :skill_master).select('users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 1)
    @Approval = Status.joins(:user, :skill_master).select('users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 2)
    @Denial = Status.joins(:user, :skill_master).select('users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 3)
    @Score = Status.joins(:user, :skill_master).select('users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 4)
  end

  def destroy
    @status.destroy

    # destroyをクラスメソッドとして呼び出し
     Satus.destroy(params[:id])

    # deleteメソッド
    #Book.delete(params[:id])
    
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def update
  #   user = Satus.find(params[:status_master_id])
  #   user.save
  #   render :json => user
  # end

  def update
    status = Status.find(:id)
    status.score = params[:score]
    status.save
  end

end
