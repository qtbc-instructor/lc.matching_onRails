class CompanyController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json

  # def index
  #   @msg = '企業マイページ'
  # end

  # def index
  #   @company_name = Company.find(params[:user_id])
  # end

  def index
    @company = Company.all
  end

  def search
    @skill_masters = SkillMaster.all
    @freedays = Freeday.all

    @search_skill = params[:skill]

    @search_freeday_change_string = params[:begin].to_s
    @search_freeday_delete_haihun = @search_freeday_change_string.delete!('-')
    @search_freeday = @search_freeday_delete_haihun.to_i

    @users = User.joins(:freeday,:company, skill: :skill_master)
     .select('users.*,freedays.*,skills.*,skill_masters.*,companies.*')
    @users = @users
    .where( skills: {skill_master_id: @search_skill})
    .where(freedays: {begin: @search_freeday})
  end

  def result
    @search_userid = params[:id]
=begin
    @users = User.joins(:freeday,:company, skill: :skill_master)
     .select('users.*,freedays.*,skills.*,skill_masters.*,companies.*')
    @users = @users
    .where(id: @search_userid)
=end
@users = User.joins(:freeday,company: :status,skill: :skill_master)
 .select('users.*,freedays.*,companies.*,statuses.*,skills.*,skill_masters.*')
 .where(id: @search_userid)



  @status = Status.new(status_params)

  # status_params[:id] = 1
  # status_params[:company_id] = 1
  # status_params[:skill_master_id] = 1
  # status_params[:status_master_id] = 1
  # status_params[:date] = 1
  # status_params[:score] = 1


  #   if @status.save
  #     render :action => "index" , notice: '講師に申請しました'
  #   else
  #     redirect_to :action => "search", notice: '講師に申請できませんでした'
  #   end
  end

  def status_params
    # params.require(:status).permit(:user_id,:company_id,:skill_master_id,:status_master_id,:date,:score)
  end

end
