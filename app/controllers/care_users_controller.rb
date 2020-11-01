class CareUsersController < ApplicationController
  def new
    @care_user = CareUser.new
  end

  def create
    @care_user = CareUser.new(care_user_params)
    if @care_user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def care_user_params
    params.require(:care_user).permit(:name)
  end
end
