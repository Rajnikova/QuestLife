class SignUpController < ApplicationController
  def index
    @users = User.all
    @same_name = 'hidden'
  end

  def new
  end

  def create
    valid = true
    puts 'vytvara'
    puts params[:sign_up][:name]
    exist_user = User.find_by(name: params[:sign_up][:name])
    puts exist_user
    if params[:sign_up][:password] != params[:sign_up][:password2]
      flash[:error] = 'Different passwords'
      valid = false
    end
    if exist_user
      puts 'user name exist'
      flash[:alert] = 'Name already in use'
      valid = false
    end

    if valid
      puts 'user name ok'
      @user = User.new(user_params)
      @user.score = 0
      @user.level = 1
      @user.save

      if @user
        log_in @user
        redirect_to @user
      end
    else
      redirect_to sign_up_path
    end

  end

  private
  def user_params
    params.require(:sign_up).permit(:name, :password, :email)
  end

  def has_same_name
    ''
  end
end
