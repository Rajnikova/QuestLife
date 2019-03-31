class UsersController < ApplicationController
  def index
    @users = User.all
    @quests = Quest.all
    @users_quests = UsersQuest.all
  end

  def new
    puts 'new'
  end

  def show
  end


  def create
    @quest = Quest.new(quest_params)
    @quest.save
    @users_quest = UsersQuest.new(user_id: current_user.id,
                                  quest_id: @quest.id, status: 0)
    @users_quest.save
    #tu 1 treba kamsi vytiahnut asi, ale to ma cas na refactor
    # adding quest to myself
    if params[:add_quest_to_mine_quests].eql?('1')
      @users_quest = UsersQuest.new(user_id: current_user.id,
                                    quest_id: @quest.id, status: 1)
      @users_quest.save
    end
    #sending quest to other user
    if params[:add_quest_to_someone].eql?('1')
      puts params[:other_user_id]
      @users_quest = UsersQuest.new(user_id: params[:other_user_id],
                                    quest_id: @quest.id, status: 1)
      @users_quest.save
    end
  end

  private
  def quest_params
    params.require(:quest).permit(:task, :reward, :description)
  end
  private
  def users_quests_params
    #toto akosi nefunguje T-T, paramtre nejdu z vonka tak to asi ani netreba?
    params.require(:usersQuest).permit(user_id: current_user.id, quest_id: @quest.id, status: 1)
  end

end
