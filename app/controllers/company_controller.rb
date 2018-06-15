class CompanyController < ApplicationController

  # def index
  #   @msg = '企業マイページ'
  # end

  # def index
  #   @company_name = Company.find(params[:user_id])
  # end

  def index
    @company = Company.all
  end

end
