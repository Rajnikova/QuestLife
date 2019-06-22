class User < ApplicationRecord
  has_many :users_quests
  has_many :quests, through: :users_quests
  has_many :users_rooms
  has_many :rooms, through: :users_rooms
  has_secure_password

  def addScore(reward)
    unless reward
      reward=0
    end

    self.score += reward
    while self.score > 1000
      self.score -= 1000
      self.level += 1
    end
    top = TopUser.last
    if !top || top.level < self.level
      new_top = TopUser.new(user_id: self.id,
                            level: self.level, score: self.score)
      new_top.save
    end
  end

  def can_add_admins?(room_id)
    type = self.users_rooms.where(room_id: room_id, status: 0)
    type.count
  end

  def has_new_quest?
    #self.users_quests.where(status: 10).count
    self.quests.where(users_quests: {status: 10}).count
  end

  def admin_in
    self.rooms.where(users_rooms: { status: 0 })
  end

  def created_quests
    self.quests.where(users_quests: { status: 0 })
  end

  def accepted_quests
    self.quests.where(users_quests: { status: 1 })
  end

  def new_quests
    self.quests.where(users_quests: { status: 10 })
  end
  def reject_quest quest_id
    UsersQuest.where(status: '10', user_id: self.id, quest_id: quest_id)
              .delete_all

  end
end
