class SchedulesController < ApplicationController
  def index
    @care_users = CareUser.all
  end

  def new
  end

  def show
  end
end
