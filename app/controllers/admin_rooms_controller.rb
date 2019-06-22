class AdminRoomsController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
    @rooms = current_user.admin_in
                         .paginate(page: params[:page], per_page: 7)
    @quest_id = params[:quest_id]
  end
  def add_to_room
    ActiveRecord::Base.transaction do
      quest_id = params[:quest_id]
      room = Room.find_by_id(params[:room_id])

      if room.has_quest? quest_id
        flash[:error] = (t :quest_is_added, scope: :flash)
        raise ActiveRecord::Rollback, 'quest already exist'
      end

      if room.add quest_id
        flash[:success] = (t :quest_added, scope: :flash)
      else
        flash[:error] = (t :quest_not_added, scope: :flash)
        raise ActiveRecord::Rollback, 'quest not added'
      end
    end
    redirect_back(fallback_location: allquests_path)

  end
end
