class User < ApplicationRecord
  has_many :users_quests
  has_many :quests, through: :users_quests
  has_many :users_rooms
  has_many :rooms, through: :users_rooms

  def addScore(reward)
    self.score+=reward

    #prida lvl
  end
end
