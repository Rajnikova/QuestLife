class AdminRoomsController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
    @rooms = current_user.rooms.where(users_rooms: { status: 0 })
                         .paginate(page: params[:page], per_page: 7)
    @quest_id = params[:quest_id]
  end
  def add_to_room
    quest_id = params[:quest_id]
    room = Room.find_by_id(params[:room_id])
    add = RoomsQuest.new(room_id: room.id,
                         quest_id: quest_id)
    if add.save!
      flash[:success] = 'Quest successfully added'
    else
      flash[:error] = 'error: quest not added'
    end

    room.users.each do |user|
      notification = UsersQuest.new(user_id: user.id,
                                    quest_id: quest_id,
                                    status: 10)
      notification.save
    end
    redirect_back(fallback_location: allquests_path)
  end
end
