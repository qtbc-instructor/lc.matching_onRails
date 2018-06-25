class CompanyController < ApplicationController
  def index
    @Applyings = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 1)
    @Approval = Status.joins(:user, :skill_master).select('users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 2)
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

  # def update
  #
  #   @score = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date, statuses.score').where("status_master_id = ?", 4)
  #
  #   @score.each do |score|
  #    @status = Status.new()
  #    @status.id = @status_id
  #    @status.name = score.name
  #    @status.skilltype = score.skilltype
  #    @status.status_master_id = score.status_master_id
  #    @status.date = score.date
  #    @status.score = score.score
  #   end
  #
  #   if @status.save
  #    flash[:notice] = "評価しました。"
  #    redirect_to :action => "update"
  #   else
  #    flash[:notice] = "評価できませんでした。"
  #    redirect_to :action => "index"
  #   end
  # end
  #
  # private
  # def set_status_id
  #   @status_id = Status.find(params[:id])
  # end

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
    # @a = params[:id]
    # @u = Status.find(@a)
    # @score = @u.update(score:5)
    # redirect_to "/company", action: :update

    # @getId = Status.find(params[:id])
    # @getId.each do |state|
    #   @status_id = state.id
    #   @status_score = state.score
    # end

    # @status_score = Status.where(params[:id])
    # @score = @status_score.update(score:5)
    # respond_to do |score|
    #   if @score.update(update)
    #     score.html { redirect_to @score, notice: '評価されました。'}
    #     score.json { render :search, status: :ok, location: @score}
    #   else
    #     score.html { render :search }
    #     score.json { render json: @score.errors, status: :unprocessable_entity }
    #   end
    # end
    redirect_to "/company", action: :update
  end
end
