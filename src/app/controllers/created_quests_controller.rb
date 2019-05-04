class CreatedQuestsController < ApplicationController
  def index
    @my_quests = current_user.quests.where(users_quests: { status: '0' }).order('created_at').paginate(page: params[:page], per_page: 7)
  end

  def delete
    quest = Quest.find(params[:quest_id])
    quest.users_quests.delete
    quest.delete
  end
end