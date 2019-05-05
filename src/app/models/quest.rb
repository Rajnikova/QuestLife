class Quest < ApplicationRecord
  has_many :users_quests
  has_many :users, through: :users_quests
  has_many :rooms_quests
  has_many :rooms, through: :rooms_quests

  def accept
    #current_user.users_quests.where(quest_id: params[:quest_id], status: 1).first.status
    self.users_quests.where(user_id: current_user.id, status: 1).first.status = 2
  end

  def status

  end
  def add

  end
  def author
    self.users.where(users_quests: {status: 0}).first
  end
end
