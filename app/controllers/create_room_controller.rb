class CreateRoomController < ApplicationController
  def index

  end

  def create
    room = Room.new(room_params)
    if room.save!
      flash[:success] = 'Room succesfully created'
    else
      flash[:error] = 'error: room not created'
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
