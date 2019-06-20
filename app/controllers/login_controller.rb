class LoginController < ApplicationController
  def index
    @users = User.all
    @quests = Quest.all
    @users_quests = UsersQuest.all
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
  end
  def show

  end
  def new

  end
  def create
    user = User.find_by(name: params[:login][:name])
    if user
      if user.authenticate(params[:login][:password])
        puts 'password ok'
        log_in user
        redirect_to home_path
      else
      flash[:error] = (t :password_wrong, scope: :flash)
      redirect_to login_path
      end
    else
      flash[:error] = (t :name_wrong, scope: :flash)
      redirect_to login_path
    end

    #if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
    #else
      # Create an error message.
    #  render 'new'
    #end
  end
  def logout
    log_out
  end
end
