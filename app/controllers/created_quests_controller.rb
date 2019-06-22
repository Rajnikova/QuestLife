class CreatedQuestsController < ApplicationController
  def index
    @my_quests = current_user.created_quests.order('created_at')
                     .paginate(page: params[:page], per_page: 7)
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
  end

  def delete
    quest = Quest.find(params[:quest_id])
    quest.delete_quest
    flash[:success] = (t :delete_s, scope: :flash)
    redirect_to created_quests_path
  end
end
