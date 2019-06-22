class QuestDetailController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
    @quest = Quest.find(params[:quest_id])
    @author = @quest.author
  end
end
