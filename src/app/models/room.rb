class Room < ApplicationRecord
  has_many :users_rooms
  has_many :users, through: :users_rooms
  has_many :rooms_quests
  has_many :quests, through: :rooms_quests
end
