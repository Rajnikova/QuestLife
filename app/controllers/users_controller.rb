class UsersController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
    @room = Room.find(params[:rooms_id])
    @admins = @room.users.where(users_rooms: {status: 0}).order('name')
                   .paginate(page: params[:page], per_page: 20)

    @members = @room.users.where(users_rooms: { status: 1 }).order('name')
                    .paginate(page: params[:page], per_page: 20)
  end
  def make_admin
    puts 'room'
    puts params[:rooms_id]
    con = User.find(params[:user_id])
              .users_rooms.where(room_id: params[:rooms_id]).first

    con.status = 0
    if con.save!
      flash[:success] = (t :admin, scope: :flash_users)
    else
      flash[:error] = (t :admin_e, scope: :flash_users)
    end
    redirect_to users_path(rooms_id: params[:rooms_id])
  end
end