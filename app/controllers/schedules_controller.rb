class SchedulesController < ApplicationController

  def index
    @schedule = Schedule.new
    @care_user = CareUser.find(params[:care_user_id])
    @care_users = CareUser.all
    @schedules = @care_user.schedules.includes(:care_user)
  end

  def new
    @care_user = CareUser.find(params[:care_user_id])
    @schedule = Schedule.new
  end

  def create
    @care_user = CareUser.find(params[:care_user_id])
    @schedule = @care_user.schedules.new(schedule_params)
    if @schedule.save
      redirect_to care_user_schedules_path(@care_user)
    else
      @schedules = @care_user.schedules.includes(:care_user)
      render :index
    end
  end

  def show
  end

  private

  def schedule_params
    params.require(:schedule).permit(:times, :title, :text).merge(care_user_id: params[:care_user_id], user_id: current_user.id)
  end
end
