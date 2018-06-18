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

end
