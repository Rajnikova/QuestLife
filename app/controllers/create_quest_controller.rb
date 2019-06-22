class CreateQuestController < ApplicationController

  def index
    @users = User.all
    @quests = Quest.all
    @users_quests = UsersQuest.all
    if current_user
      @has_new_quest = current_user.has_new_quest?
    end
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
      end

      unless @quest.correct_reward?
        flash[:error] = (t :reward, scope: :flash)
        raise ActiveRecord::Rollback, "wrong reward"
      end

      unless @quest.save!
        flash[:error] = (t :quest_not_created, scope: :flash)
        raise ActiveRecord::Rollback, "Quest not created"
      end
      unless @quest.set_author current_user
        flash[:error] = (t :quest_not_added, scope: :flash)
        raise ActiveRecord::Rollback, "quest not added"
      end

      # adding quest to myself
      if params[:add_quest_to_mine_quests].eql?('1')
        unless @quest.add_to_user current_user
          flash[:error] = (t :quest_not_added, scope: :flash)
          raise ActiveRecord::Rollback, "quest not added"
        end
      end
      #sending quest to other user
      if params[:add_quest_to_someone].eql?('1')
        user = User.find_by(name: params[:quest][:other_user_name])
        if user
          unless @quest.send_to_user user
            flash[:error] = (t :quest_not_added, scope: :flash)
            raise ActiveRecord::Rollback, "quest not added"
          end
        else
          flash[:error] = (t :no_user, scope: :flash)
          raise ActiveRecord::Rollback, "No user with this name"

        end

      end

      flash[:success] = (t :quest_send, scope: :flash)
    end
    redirect_to create_quest_path
  end





  private
  def quest_params
    params.require(:quest).permit(:task, :reward, :description)
  end

  private
  def users_quests_params
    params.require(:usersQuest).permit(user_id: current_user.id,
                                       quest_id: @quest.id,
                                       status: 1)
  end

end

