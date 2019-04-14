class QuestsController < ApplicationController
  def index
    @users = User.all
    @quests = Quest.all
    @users_quests = UsersQuest.all
  end
  def new
  end
  def create
    puts 'created'
    puts params[:completed_quest_id]
  end
  def complete
    puts 'completed'
    puts params[:completed_quest_id]
    connection = current_user.users_quests.where(quest_id: params[:completed_quest_id], status: 1).first
    if connection.status.eql?(1)
      connection.status = 2
      connection.save
    end
  end

  def accept
    quest = Quest.find(params[:quest_id])
    #netreba asi daj tam rovno id
    quest.users_quests.where(user_id: current_user.id, status: 1).first.delete
    @users_quest = UsersQuest.new(user_id: current_user.id,
                                  quest_id: quest.id, status: 2)
    #quest.accept
    if quest.save
      flash[:success] = 'Quest completed'
    else
      flash[:alert] = 'error counld not save quest'
    end
    redirect_back(fallback_location: quests_path)
  end
end
