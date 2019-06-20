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
    #completing quest
    quest = Quest.find(params[:quest_id])




    ActiveRecord::Base.transaction do
      begin
        current_user.addScore(quest.reward)
        current_user.save!

        status = quest.users_quests.where(user_id: current_user.id, status: 1).first
        status.update!(status: 2)

        if status.save!
          flash[:success] = 'Quest completed, CONGRATULATION!!!'
        else
          flash[:alert] = 'error could not save quest'
          rollback
        end
      end
    end
    redirect_to quests_path
  end
end
