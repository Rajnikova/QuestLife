class UsersController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
    @room = Room.find(params[:rooms_id])
    @admins = @room.admins.order('name')
                   .paginate(page: params[:page], per_page: 20)

    @members = @room.members.order('name')
                    .paginate(page: params[:page], per_page: 20)
  end
  def make_admin
    @room = Room.find(params[:rooms_id])
    if @room.make_admin params[:user_id]
      flash[:success] = (t :admin, scope: :flash_users)
    else
      flash[:error] = (t :admin_e, scope: :flash_users)
    end
    redirect_to users_path(rooms_id: params[:rooms_id])
  end
end