class CompanyController < ApplicationController

# 評価の平均を講師の横にだす


  # GET /books
  # GET /books.json
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
    # @a=params[:key]
    # @b = Status.select('id,score').where(id: @a)
    # @b.each do |f|
    #   @c = f.id
    # end
    u=Status.find(6).update_attributes(score:5)
  end
    # @status_score = Status.find(params[:id]
    #
    # respond_to do |score|
    #   if @score.update(update)
    #     score.html { redirect_to @score, notice: '評価されました。'}
    #     score.json { render :index, status: :ok, location: @score}
    #   else
    #     score.html { render :index }
    #     score.json { render json: @score.errors, status: :unprocessable_entity }
    #   end
    # end
    # redirect_to "/company", action: :update


  def search
    #Viewで検索条件表示に使用
    @skill_masters = SkillMaster.all

    session[:search_skill] = params[:skill]
    session[:search_freeday] = params[:begin]


    @free = Freeday.select('id,begin,end')
    @free.each do |f|
      @id = f.id
      @begin = f.begin
      @end = f.end
    end

    #検索実行
      @users = User.joins(:freeday, skill: :skill_master)
       .select('users.*,freedays.begin,freedays.end,skill_masters.skilltype')
       .where( skills: { skill_master_id: session[:search_skill] } )
       .where( freedays: { begin: session[:search_freeday] } )

      @users.each do |u_score|
        @lecture_id = u_score.id
      end

    @users_status = User.joins(:freeday, skill: {skill_master: :status})
      .select('users.*,freedays.begin,freedays.end,skill_masters.skilltype,statuses.score')
      .where( skills: { skill_master_id: session[:search_skill] })
      .where( freedays: { begin: session[:search_freeday] })
      .where( statuses: { user_id: @lecture_id })

  end

  def result
    @search_userid = params[:id]

    @users = User.joins(:freeday,:company,:skill)
     .select('users.id,name,freedays.begin,companies.id,companyname,skills.skill_master_id')
     .where(@search_userid)

    @companies = User.joins(:company)
      .select('users.id,companies.id')
     .find(@usr.id)

     @status = Status.new()
     @status.user_id = @search_userid
     @status.company_id = @companies.id
     @status.skill_master_id = session[:search_skill]
     @status.status_master_id = 1
     @status.date = session[:search_freeday]
     @status.score = 0
     logger.debug "=======================-"
    if @status.save
     flash[:notice] = "講師に申請しました。"
     redirect_to :action => "index"
    else
      logger.debug @status.errors.messages
      logger.debug "=======================-"
     flash[:notice] = "講師に申請できませんでした。"
     redirect_to :action => "search"
   end
  end
end
