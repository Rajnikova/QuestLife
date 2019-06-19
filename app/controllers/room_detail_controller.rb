class RoomDetailController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @room_quests = @room.quests.paginate(page: params[:page], per_page: 7)
    if current_user
      @joined = @room.users_rooms.where(user_id: current_user.id)
    end
  end

  def join
    @joined = UsersRoom.new(user_id: current_user.id,
                            room_id: params[:rooms_id], status: 1)
    if @joined.save!
      flash[:success] = 'Room joined'
    else
      flash[:error] = 'error: join failed'
    end
    redirect_back(fallback_location: room_detail_path)
  end
  def leave
    @joined = UsersRoom.where(user_id: current_user.id,
                              room_id: params[:rooms_id], status: 1)
    if @joined.delete_all
      flash[:success] = 'Room left'
    else
      flash[:error] = 'error: leaving failed'
    end
    redirect_back(fallback_location: room_detail_path)
  end
end
