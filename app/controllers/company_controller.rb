class CompanyController < ApplicationController


# 評価の平均を講師の横にだす

  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json

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
  #test

  def update
    status = Status.find(params[:id])
    status.score = Status.find_by(score: params[:score])
    status.save
  end

  def search
    #Viewで検索条件表示に使用
    @skill_masters = SkillMaster.all

    #検索条件を設定
    @search_skill = params[:skill]
    @date = params[:begin]

    #検索実行
    @users = User.joins(:freeday, skill: :skill_master)
     .select('users.*,freedays.begin,freedays.end,skill_masters.skilltype')
    .where( skills: {skill_master_id: @search_skill})
    .where(freedays: {begin: @date})

    # @users = User.joins(:freeday, skill: {skill_master: :status})
    #  .select('users.*,freedays.begin,skill_masters.skilltype,statuses.score,statuses.status_master_id')
    # .where( skills: {skill_master_id: @search_skill})
    # .where(freedays: {begin: @date})
    # .where(freedays: {begin: @date})
    # .where(statuses: {status_master_id: nil})


    @score = Status.select('id,user_id,skill_master_id,date,score')
      .where(user_id: 2)
      .where(date: @date)
      .where(skill_master_id: @search_skill)

      @score.each do |id|
        @name = id.id
        if @name.present? then

        else
          @total = 0
          @total += id.score
        end
      end

    @hyouka = User.select('name').where(id: @name)
  end

  def result
    @search_userid = params[:id]

    @users = User.joins(:freeday, skill: :skill_master)
     .select('users.*,freedays.*,skills.*,skill_masters.*')
     .where(id: @search_userid)

    @users.each do |user|
     @status = Status.new()
     @status.user_id = @search_userid
     @status.company_id = @usr.id
     @status.skill_master_id = user.skill_master_id
     @status.status_master_id = 1
     @status.date = user.begin
     @status.score = ''
    end

    if @status.save
     flash[:notice] = "講師に申請しました。"
     redirect_to :action => "index"
    else
     flash[:notice] = "講師に申請できませんでした。"
     redirect_to :action => "search"
    end
  end
end
