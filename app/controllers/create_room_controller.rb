class CreateRoomController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
  end

  def create
    room = Room.new(room_params)
    if room.save!
      flash[:success] = (t :room_s, scope: :flash)
    else
      flash[:error] = (t :room_e, scope: :flash)
    end
    author = UsersRoom.new(user_id: current_user.id,
                           room_id: room.id,
                           status: 0)
    author.save
    redirect_to create_room_path
  end

  def room_params
    params.require(:room).permit(:name, :description)
  end
end
