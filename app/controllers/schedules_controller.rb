class SchedulesController < ApplicationController

  def index
    @schedule = Schedule.new
    @care_user = CareUser.find(params[:care_user_id])
    @care_users = CareUser.all
  end

  def create
    @care_user = CareUser.find(params[:care_user_id])
    @schedule = @care_user.schedules.new(schedule_params)
    @schedule.save
  end

  def show
  end

  private

  def schedule_params
    params.require(:schedule).permit(:times, :title, :text)
  end
end
