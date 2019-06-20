class RoomDetailController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
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
      flash[:success] = (t :room_join, scope: :flash)
    else
      flash[:error] = (t :room_join_e, scope: :flash)
    end
    redirect_back(fallback_location: room_detail_path)
  end
  def leave
    @joined = UsersRoom.where(user_id: current_user.id,
                              room_id: params[:rooms_id], status: 1)
    if @joined.delete_all
      flash[:success] = (t :room_left, scope: :flash)
    else
      flash[:error] = (t :room_left_e, scope: :flash)
    end
    redirect_back(fallback_location: room_detail_path)
  end
end
