class User < ApplicationRecord
  has_many :users_quests
  has_many :quests, through: :users_quests

  def addScore(reward)
    self.score+=reward

    #prida lvl
  end
end
