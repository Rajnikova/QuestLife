class NewQuestsController < ApplicationController
  def index
    @new_quests = Quest.joins(:users_quests)
                       .where(users_quests: { status: '10',
                                              user_id: current_user })
                       .paginate(page: params[:page], per_page: 7)
  end

  def delete
    UsersQuest.where(status: '10', user_id: current_user,
                     quest_id: params[:quest_id]).delete_all
    redirect_back(fallback_location: new_quest_path)
  end
end
