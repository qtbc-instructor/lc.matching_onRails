class CompanyController < ApplicationController

  def index
    @msg = '企業マイページ'
  end

  def user
    @company_name = find  
end
