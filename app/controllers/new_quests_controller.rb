class NewQuestsController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
    @new_quests = Quest.joins(:users_quests)
                      .where(users_quests: { status: '10',
                                             user_id: current_user })
                      .paginate(page: params[:page], per_page: 7)
  end

  def delete
    UsersQuest.where(status: '10', user_id: current_user,
                     quest_id: params[:quest_id]).delete_all
    redirect_back(fallback_location: new_quest_path)
    flash[:alert] = (t :quest_delete, scope: :flash)
  end
  def new
    #accepting new quest
    puts params[:quest_id]
    quest = Quest.find(params[:quest_id])
    @users_quest = UsersQuest.new(user_id: current_user.id,
                                  quest_id: quest.id, status: 1)
    puts params[:quest_id]
    if @users_quest.save!
      flash[:success] = (t :quest_accept, scope: :flash)
      puts 'pridalo'
    else
      flash[:error] = (t :quest_accept_e, scope: :flash)
    end
    @users_quest = UsersQuest.where(user_id: current_user,
                                    quest_id: quest.id,
                                    status: 10).delete_all
    redirect_to new_quests_path
  end
end