class Quest < ApplicationRecord
  has_many :users_quests
  has_many :users, through: :users_quests
end
