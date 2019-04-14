class AllquestsController < ApplicationController
  def index
    @quests = Quest.all.order('id').paginate(page: params[:page], per_page: 7)
    @users_quests = UsersQuest.all

  end
  def new
    #accepting new quest
    puts 'totoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo'
    puts params[:quest_id]
    quest = Quest.find(params[:quest_id])
    @users_quest = UsersQuest.new(user_id: current_user.id,
                                  quest_id: quest.id, status: 1)
    puts params[:quest_id]
    @users_quest.save
  end
end
