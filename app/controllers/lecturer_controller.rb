class LecturerController < ApplicationController

  def index
    @users = User.find(params[:id])
    @user = @users.id
    @freedays = Freeday.where(user_id: @user)
    @skills = Skill.where(user_id: @user)
  end

  def add_free
    @freeday = Freeday.new
  end

end
