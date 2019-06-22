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
    ActiveRecord::Base.transaction do
      quest_id = params[:quest_id]
      room = Room.find_by_id(params[:room_id])

      exist = room.quests.where(quests: {id: quest_id}).count
      if exist > 0
        flash[:error] = (t :quest_is_added, scope: :flash)
        raise ActiveRecord::Rollback, "quest already exist"
      end

      add = RoomsQuest.new(room_id: room.id,
                           quest_id: quest_id)

      if add.save!
        flash[:success] = (t :quest_added, scope: :flash)
      else
        flash[:error] = (t :quest_not_added, scope: :flash)
        raise ActiveRecord::Rollback, "quest not added"
      end

      room.users.each do |user|
        notification = UsersQuest.new(user_id: user.id,
                                      quest_id: quest_id,
                                      status: 10)
        notification.save
      end
    end
    redirect_back(fallback_location: allquests_path)

  end
end
