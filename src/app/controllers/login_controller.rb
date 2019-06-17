class LoginController < ApplicationController
  def index
    @users = User.all
    @quests = Quest.all
    @users_quests = UsersQuest.all
  end
  def show

  end
  def new

  end
  def create
    user = User.find_by(name: params[:login][:name])
    if user
      puts 'testing password'
      if user.authenticate(params[:login][:password])
        puts 'password ok'
        log_in user
        redirect_to user
      else
      puts 'wrong passsword'
      flash[:error] = 'Wrong password'
      redirect_to login_path
      end
    else
      puts 'wring name'
      flash[:error] = 'No user with this name'
      redirect_to login_path
    end

    #if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
    #else
      # Create an error message.
    #  render 'new'
    #end
  end

end
