class QuestDetailController < ApplicationController
  def index
    @quest = Quest.find(params[:quest_id])
    @author = @quest.users.where(users_quests: { status: '0' }).first
  end
end
