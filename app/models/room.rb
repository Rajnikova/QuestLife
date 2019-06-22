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
  def create_new author
    correct = true
    ActiveRecord::Base.transaction do
      unless self.save!
        correct = false
        raise ActiveRecord::Rollback, "room save failed"
      end
      con = UsersRoom.new(user_id: author.id,
                          room_id: self.id,
                          status: 0)
      unless con.save!
        correct = false
        raise ActiveRecord::Rollback, "autor not set"
      end
    end
    correct
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
