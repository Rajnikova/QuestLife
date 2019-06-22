class QuestsController < ApplicationController
  def index
    @users = User.all
    @quests = Quest.all
    @users_quests = UsersQuest.all
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
  end
  def complete
    quest = Quest.find(params[:quest_id])
    quest.complete current_user

  end

  def accept
    #completing quest
    quest = Quest.find(params[:quest_id])

    ActiveRecord::Base.transaction do
      begin
        if quest.complete current_user
          flash[:success] = (t :quest_completed, scope: :flash)
        else
          flash[:alert] = (t :quest_completed_e, scope: :flash)
          raise ActiveRecord::Rollback, "completing  failed"
        end

      end
    end
    redirect_to quests_path
  end
end
