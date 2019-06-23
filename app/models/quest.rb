class Quest < ApplicationRecord
  has_many :users_quests
  has_many :users, through: :users_quests
  has_many :rooms_quests
  has_many :rooms, through: :rooms_quests

  def accept (user)
    usersQuest = UsersQuest.new(user_id: user.id,
                                quest_id: self.id, status: 1)
    usersQuest.save!
  end

  def delete_quest
    self.users_quests.delete_all
    self.rooms_quests.delete_all
    self.delete
  end
  def complete(user)
    correct = true
    user.addScore(self.reward)
    unless user.save!
      raise ActiveRecord::Rollback, "adding score failed"
      correct = false
    end
    connection = UsersQuest.where(user_id: user.id, quest_id: self.id, status: 1).first
    if connection && connection.status.eql?(1)
      connection.status = 2
      unless connection.save!
        raise ActiveRecord::Rollback, "completing save failed"
        correct = false
      end
    else
      false
    end
    correct
  end

  def author
    self.users.where(users_quests: { status: 0 }).first
  end

  def set_author(user)
    users_quest = UsersQuest.new(user_id: user.id,
                                 quest_id: self.id,
                                 status: 0)
    users_quest.save!
  end

  def add_to_user user
    users_quest = UsersQuest.new(user_id: user.id,
                                 quest_id: self.id,
                                 status: 1)
    users_quest.save!
  end

  def send_to_user user
    users_quest = UsersQuest.new(user_id: user.id,
                                 quest_id: self.id,
                                 status: 10)
    users_quest.save!
  end

  def correct_reward?
    if !self.reward || self.reward < 0 || self.reward > 100
      false
    else
      true
    end
  end

  def completed_times
    self.users.where(users_quests: {status: 2}).count
  end
  def accepted_times
    self.users.where(users_quests: {status: 1}).count
  end
end
