class CompanyController < ApplicationController
  def index
    @Applying = Status.where("status_master_id = ?", 1)
    @Approval = Status.where("status_master_id = ?", 2)
    @Denial = Status.where("status_master_id = ?", 3)
    @Score = Status.where("status_master_id = ?", 4)
  end

  def destroy
    @company_delet = Company.find(params[:id])
    @company_delet.destroy
    redirect_to :companies
  end

end
