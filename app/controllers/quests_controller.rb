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
end
