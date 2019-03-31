class LoginController < ApplicationController
  def index
    @users = User.all
    @quests = Quest.all
    @users_quests = UsersQuest.all
  end
  def new

  end
  def create
    user = User.find_by(name: params[:login][:name])
    if user
      log_in user
      redirect_to user
    end

    #if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
    #else
      # Create an error message.
    #  render 'new'
    #end
  end

end
