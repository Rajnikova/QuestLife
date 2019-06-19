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
    @quest.public = false
    if params[:public].eql?('1')
      @quest.public = true
      puts 'is public'
    end
    if !@quest.reward || @quest.reward<0 || @quest.reward>100
      flash[:error] = 'reward must be between 0-100'
    else
      if @quest.save!
        flash[:success] = 'Quest successfully created'
      else
        flash[:error] = 'error: quest not created'
      end
      @users_quest = UsersQuest.new(user_id: current_user.id,
                                    quest_id: @quest.id,
                                    status: 0)
      @users_quest.save
      #tu 1 treba kamsi vytiahnut asi, ale to ma cas na refactor
      # adding quest to myself
      if params[:add_quest_to_mine_quests].eql?('1')
        @users_quest = UsersQuest.new(user_id: current_user.id,
                                      quest_id: @quest.id,
                                      status: 1)

        if @users_quest.save!
          flash[:success] = 'Quest addded to my quests'
        else
          flash[:error] = 'error: quest added'
        end

      end
      #sending quest to other user
      if params[:add_quest_to_someone].eql?('1')
        user = User.find_by(name: params[:quest][:other_user_name])
        if user
          @users_quest = UsersQuest.new(user_id: user.id,
                                        quest_id: @quest.id,
                                        status: 10)

          if @users_quest.save!
          flash[:success] = 'Quest send'
            puts 'send'
          else
            flash[:error] = 'error: quest not send'
          end
        else
        flash[:alert] = 'no user with this name'
          puts 'nenasiel'
        end

      end
    end
    redirect_to users_path
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
