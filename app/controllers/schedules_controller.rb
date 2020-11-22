class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_care_user
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedule = Schedule.new
    @care_users = CareUser.all
    @schedules = @care_user.schedules.where("created_at >= ?", Date.today)
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = @care_user.schedules.new(schedule_params)
    if @schedule.save
      redirect_to care_user_schedules_path(@care_user)
    else
      @schedules = @care_user.schedules.includes(:care_user)
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @schedule.comments.includes(:user)
  end

  def edit

  end  

  def update
    if @schedule.update(schedule_params)
      redirect_to care_user_schedule_path(@care_user,@schedule)
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to care_user_schedules_path(@care_user)
  end

  def past
    @schedule = Schedule.new
    @care_users = CareUser.all
    @past_schedules = @care_user.schedules.where(created_at: 1.day.ago.all_month)
  end

  private

  def schedule_params
    params.require(:schedule).permit(:times, :title, :text, images: []).merge(care_user_id: params[:care_user_id], user_id: current_user.id)
  end

  def set_care_user
    @care_user = CareUser.find(params[:care_user_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
