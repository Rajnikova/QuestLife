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
    self.users_quests.where(status: 10).count

  end
end
