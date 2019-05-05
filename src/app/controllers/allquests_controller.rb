class AllquestsController < ApplicationController
  def index
    @quests = Quest.all.order('id').paginate(page: params[:page], per_page: 7)
    @users_quests = UsersQuest.all

  end
  def new
    #accepting new quest
    puts params[:quest_id]
    quest = Quest.find(params[:quest_id])
    @users_quest = UsersQuest.new(user_id: current_user.id,
                                  quest_id: quest.id, status: 1)
    puts params[:quest_id]
    if @users_quest.save!
      flash[:success] = 'Quest successfully added'
      puts 'pridalo'
    else
      flash[:error] = 'error: quest not added'
    end
  end
  def show

  end
end
