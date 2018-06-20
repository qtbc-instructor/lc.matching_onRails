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

  def shinsei
    render :action => 'search'
  end

end
