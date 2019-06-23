class RoomDetailController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
    @room = Room.find(params[:room_id])
    @room_quests = @room.quests.order("rooms_quests.created_at DESC")
                        .paginate(page: params[:page], per_page: 7)
    if current_user
      @joined = @room.have_user current_user
    end
  end

  def join
    @room = Room.find(params[:room_id])
    if @room.join_user current_user
      flash[:success] = (t :room_join, scope: :flash)
    else
      flash[:error] = (t :room_join_e, scope: :flash)
    end
    redirect_back(fallback_location: room_detail_path)
  end

  def leave
    @room = Room.find(params[:room_id])
    if @room.leave_user current_user
      flash[:success] = (t :room_left, scope: :flash)
    else
      flash[:error] = (t :room_left_e, scope: :flash)
    end
    redirect_back(fallback_location: room_detail_path)
  end

  def delete
    room = Room.find(params[:room_id])
    if room.delete_room
      flash[:success] = (t :room_delete, scope: :flash)
    else
      flash[:error] = (t :room_delete_e, scope: :flash)
    end
    redirect_to rooms_path
  end
end
