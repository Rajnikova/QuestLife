class IndexController < ApplicationController
  def index
    @users = User.all
    @quests = Quest.all
    @users_quests = UsersQuest.all
    @logged_User = nil
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
  end

  def new

  end


end
