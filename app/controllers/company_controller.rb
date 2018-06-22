class CompanyController < ApplicationController

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
  @skill_masters = SkillMaster.all
    #@freedays = Freeday.all
    # @search_freeday_change_string = params[:begin].to_s
    # @search_freeday_delete_haihun = @search_freeday_change_string.delete!('-')
    # @search_freeday = @search_freeday_delete_haihun.to_i
  @search_skill = params[:skill]
  @date = params[:begin]


  @users = User.joins(:freeday, skill: :skill_master)
   .select('users.*,freedays.*,skills.*,skill_masters.*')
  @users = @users
  .where( skills: {skill_master_id: @search_skill})
  .where(freedays: {begin: @date})

    # @search_skill = params[:skill]
    # @mozi = params[:begin].to_s
    # @date = DateTime.parse(params[:begin])
    #
    # @users = User.joins(:freeday, company: :status, skill: :skill_master)
    #  .select('users.*,freedays.*,skills.*,skill_masters.*,companies.*,statuses.*')
    # @users = @users
    # .where(skills: {skill_master_id: @search_skill})
    # .where(freedays: {begin: @date})
  end

  def result
    @search_userid = params[:id]
    # @search_userid = 2

=begin
    @users = User.joins(:freeday,:company, skill: :skill_master)
     .select('users.*,freedays.*,skills.*,skill_masters.*,companies.*')
    @users = @users
    .where(id: @search_userid)
=end


# companyテーブルに何もないと保存できない
# 新規登録のとき講師と会社を紐付けしないと、statusテーブルが結合できない
# 新規登録の時に講師にひもづく担当者が必要

@users = User.joins(:freeday, skill: :skill_master)
 .select('users.*,freedays.*,skills.*,skill_masters.*')
 .where(id: @search_userid)

 # @users.each do |user|

   # @userdate = user.begin
   # @userdate = @userdate.to_s
   # @userdate = @userdate.delete!('-')
   # @userdate = @userdate.to_i

   # @status = Status.new()
   #
   # @status.user_id = user.id
   # @status.company_id = 1
   # @status.skill_master_id = user.skill_master_id
   # @status.status_master_id = 0
   # @status.date = user.begin
   # @status.score = ''

 # end
 # if @status.save
 #   redirect_to :action => "index" , flash: '講師に申請しました'
 # else
 #   redirect_to :action => "search", flash: '講師に申請できませんでした'
 # end





  # @status = Status.new()
  #
  #
  # @status.user_id = @users.id
  # @status.company_id = @users.company_id
  # @status.skill_master_id = @users.skill_masater_id
  # @status.status_master_id = 0
  # @status.date = @users.begin
  # @status.score = '未定'
  #
  #
  #   if @status.save
  #     redirect_to :action => "index" , flash: '講師に申請しました'
  #   else
  #     redirect_to :action => "search", flash: '講師に申請できませんでした'
  #   end
  end

  def status_params
    # params.require(:status).permit(:user_id,:company_id,:skill_master_id,:status_master_id,:date,:score)
  end

end
