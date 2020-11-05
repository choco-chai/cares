class CommentsController < ApplicationController
  def create
    @care_user = CareUser.find(params[:care_user_id])
    @schedule = Schedule.find(params[:schedule_id])
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to care_user_schedule_path(@care_user,@schedule)
    else
      @schedule = @comment.schedule
      @comments = @schedule.comments
      render "schedule/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, care_user_id: params[:care_user_id], schedule_id: params[:schedule_id])
  end

end
