class LecturerController < ApplicationController

  def index
    # @users = User.find(12)
    @users = @usr
    @user = @users.id
    @freedays = Freeday.where(user_id: @user)
    @skills = Skill.where(user_id: @user)
    @freeday = Freeday.new
  end

  def create_free
    @freeday = Freeday.new(freeday_params)
    if @freeday.save
      flash[:notice] = '日付を登録しました'
    else
      flash[:notice] = '日付の登録に失敗しました'
    end
    redirect_to :action => "index",:id => @freeday.user_id
  end

  def delete_free
    @users = @usr
    # @users = User.find(12)
    @user = @users.id
    if Freeday.destroy(checked_free)
      flash[:notice] = '日付を削除しました'
    else
      flash[:notice] = '削除に失敗しました'
    end
    redirect_to :action => "index",:id => @user
  end

  def checked_free
    params.require(:freeday_id)
  end

  def freeday_params
    params.require(:freeday).permit(:user_id,:begin,:end)
  end

  def set_user
    @users = User.find(params[:id])
    @user = @users.id
  end

end
