class CreateQuestController < ApplicationController

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
    ActiveRecord::Base.transaction do
      @quest = Quest.new(quest_params)
      @quest.public = false
      if params[:public].eql?('1')
        @quest.public = true
        puts 'is public'
      end
      if !@quest.reward || @quest.reward<0 || @quest.reward>100
        flash[:error] = 'reward must be between 0-100'
        raise ActiveRecord::Rollback, "wrong reward"
      end

      unless @quest.save!
        flash[:error] = 'error: quest not created'
        raise ActiveRecord::Rollback, "Quest not created"
      end
      @users_quest = UsersQuest.new(user_id: current_user.id,
                                    quest_id: @quest.id,
                                    status: 0)
      @users_quest.save
      # adding quest to myself
      if params[:add_quest_to_mine_quests].eql?('1')
        @users_quest = UsersQuest.new(user_id: current_user.id,
                                      quest_id: @quest.id,
                                      status: 1)

        unless @users_quest.save!
          flash[:error] = 'error: quest not added'
          raise ActiveRecord::Rollback, "quest not added"
        end

      end
      #sending quest to other user
      if params[:add_quest_to_someone].eql?('1')
        user = User.find_by(name: params[:quest][:other_user_name])
        if user
          @users_quest = UsersQuest.new(user_id: user.id,
                                        quest_id: @quest.id,
                                        status: 10)

          unless @users_quest.save!
            flash[:error] = 'error: quest not send'
            raise ActiveRecord::Rollback, "Cquest not send"
          end
        else
          flash[:error] = 'no user with this name'
          raise ActiveRecord::Rollback, "No user with this name"

        end

      end

      flash[:success] = 'Quest successfully created'
    end
    redirect_to create_quest_path
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

