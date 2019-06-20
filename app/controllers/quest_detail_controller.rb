class QuestDetailController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
    @quest = Quest.find(params[:quest_id])
    @author = @quest.users.where(users_quests: { status: '0' }).first
  end
end
