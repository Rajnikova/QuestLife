class IndexController < ApplicationController
  def index
    @users = User.all
    @quests = Quest.all
    @users_quests = UsersQuest.all
    @logged_User = nil
  end

  def new

  end


end
