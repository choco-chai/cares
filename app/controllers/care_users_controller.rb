class CareUsersController < ApplicationController
  def new
    @care_user = CareUser.new
  end
end
