class AllquestsController < ApplicationController
  def index
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
    @quests = Quest.where(public: true).order('id DESC').paginate(page: params[:page], per_page: 7)
    @users_quests = UsersQuest.all

  end
  def new
    #accepting new quest
    puts params[:quest_id]
    quest = Quest.find(params[:quest_id])
    @users_quest = UsersQuest.new(user_id: current_user.id,
                                  quest_id: quest.id, status: 1)
    puts params[:quest_id]
    if @users_quest.save!
      flash[:success] = (t :quest_added, scope: :flash)
      puts 'pridalo'
    else
      flash[:error] = (t :quest_not_added, scope: :flash)
    end
    redirect_to allquests_path
  end
  def show

  end
end
