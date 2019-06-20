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
  def new
    #accepting new quest
    puts params[:quest_id]
    quest = Quest.find(params[:quest_id])
    @users_quest = UsersQuest.new(user_id: current_user.id,
                                  quest_id: quest.id, status: 1)
    puts params[:quest_id]
    if @users_quest.save!
      flash[:success] = 'Quest successfully accepted'
      puts 'pridalo'
    else
      flash[:error] = 'error: quest not added'
    end
    @users_quest = UsersQuest.where(user_id: current_user,
                                    quest_id: quest.id,
                                    status: 10).delete_all
    redirect_to new_quests_path
  end
end