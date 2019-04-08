class IndexController < ApplicationController
  def index
    @users = User.all
    @quests = Quest.all
    @users_quests = UsersQuest.all
    @logged_User = nil
  end

  def new

  end
  def create
    @user = User.new(user_params)
    @user.save

    @logged_User = :name
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

end
