class LecturerController < ApplicationController

  def index
    @user = User.params[:id]
  end

end
