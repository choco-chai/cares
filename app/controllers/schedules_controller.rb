class SchedulesController < ApplicationController

  def index
    @schedule = Schedule.new
    @care_user = CareUser.find(params[:care_user_id])
    @care_users = CareUser.all
    @schedules = @care_user.schedules.where("created_at >= ?", Date.today)
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
      render :new
    end
  end

  def show
    @care_user = CareUser.find(params[:care_user_id])
    @schedule = Schedule.find(params[:id])
    @comment = Comment.new
    @comments = @schedule.comments.includes(:user)
  end

  def edit
    @care_user = CareUser.find(params[:care_user_id])
    @schedule = Schedule.find(params[:id])
  end  

  def update
    @care_user = CareUser.find(params[:care_user_id])
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to care_user_schedule_path(@care_user,@schedule)
    else
      render :edit
    end
  end

  def destroy
    @care_user = CareUser.find(params[:care_user_id])
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to care_user_schedules_path(@care_user)
  end

  private

  def schedule_params
    params.require(:schedule).permit(:times, :title, :text, images: []).merge(care_user_id: params[:care_user_id], user_id: current_user.id)
  end
end
