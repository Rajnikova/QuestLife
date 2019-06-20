class SignUpController < ApplicationController
  def index
    @users = User.all
    @same_name = 'hidden'
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
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
      flash[:error] = (t :pass_difrent, scope: :flash_sign)
      valid = false
    end
    if exist_user
      puts 'user name exist'
      flash[:alert] = (t :name_exist, scope: :flash_sign)
      valid = false
    end

    if valid
      puts 'user name ok'
      @user = User.new(user_params)
      puts @user
      @user.score = 0
      @user.level = 1
      @user.save

      if @user
        log_in @user
        puts 'logged, redirecting'
        redirect_to home_path
      end
    else
      redirect_to sign_up_path
    end

  end

  private
  def user_params
    #crypt_password = BCrypt::Password.create(params[:sign_up][:password])
    #puts crypt_password
    params.require(:sign_up).permit(:name, :password, :email)
    #params.require(:sign_up).permit(:name, crypt_password, :email)
  end

  def has_same_name
    ''
  end
end
