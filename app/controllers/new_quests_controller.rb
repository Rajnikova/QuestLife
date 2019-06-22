class NewQuestsController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
      @new_quests = current_user.new_quests
                                .paginate(page: params[:page], per_page: 7)
    end
  end

  def delete
    current_user.reject_quest params[:quest_id]
    flash[:alert] = (t :quest_deleted, scope: :flash)

    redirect_back(fallback_location: new_quest_path)
  end
  def new
    #accepting new quest
    puts params[:quest_id]
    quest = Quest.find(params[:quest_id])
    if quest.accept current_user
      flash[:success] = (t :quest_added, scope: :flash)
    else
      flash[:error] = (t :quest_not_added, scope: :flash)
    end
    @users_quest = UsersQuest.where(user_id: current_user,
                                    quest_id: quest.id,
                                    status: 10).delete_all
    redirect_to new_quests_path
  end
end