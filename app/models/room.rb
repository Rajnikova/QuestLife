class Room < ApplicationRecord
  has_many :users_rooms
  has_many :users, through: :users_rooms
  has_many :rooms_quests
  has_many :quests, through: :rooms_quests

  def add(quest_id)
    add = RoomsQuest.new(room_id: self.id,
                         quest_id: quest_id)
    if add.save!
      self.send_notification quest_id
      true
    else
      false
    end
  end

  def has_quest? (quest_id)
    has = self.quests.where(quests: { id: quest_id }).count
    has.positive?

  end

  def send_notification (quest_id)
    self.users.each do |user|
      notification = UsersQuest.new(user_id: user.id,
                                    quest_id: quest_id,
                                    status: 10)
      notification.save
    end
  end
end
