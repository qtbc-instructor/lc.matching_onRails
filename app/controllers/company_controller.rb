class CompanyController < ApplicationController

  def index
    if @usr.usertype != 1 then
      redirect_to '/'
    end
    @user = @usr
    @user_id = @user.id
    @companies = User.joins(:company).select('users.id,companies.companyname,companies.id').find(@user_id)

    # status_master_idによってわかれる
    @Applyings = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 1).where("company_id = ?", @companies.id)
    @Approval = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 2).where("company_id = ?", @companies.id)
    @Denial = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date').where("status_master_id = ?", 3).where("company_id = ?", @companies.id)
    @Score = Status.joins(:user, :skill_master).select('statuses.id, users.name, skill_masters.skilltype, statuses.date, statuses.score').where("status_master_id = ?", 4).where("company_id = ?", @companies.id)
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
    redirect_to "/company"
  end

  def update
    # 評価更新の確認
    logger.debug "=========================================="
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

     @users_status = User.joins(:freeday, skill: {skill_master: :status})
       .select('users.*,freedays.begin,freedays.end,skill_masters.skilltype,statuses.score')
       .where( skills: { skill_master_id: session[:search_skill] })
       .where( freedays: { begin: session[:search_freeday] })
       .where( statuses: { user_id: @lecture_id })

   end




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
       .where(Freeday.arel_table[:begin].lteq(session[:search_freeday]))
       .where(Freeday.arel_table[:end].gteq(session[:search_freeday]))

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
