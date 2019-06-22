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
  def admins
    self.users.where(users_rooms: { status: 0 })
  end
  def members
    self.users.where(users_rooms: { status: 1 })
  end
  def has_quest? (quest_id)
    has = self.quests.where(quests: { id: quest_id }).count
    has.positive?

  end
  def have_user(user)
    self.users.where(users: {id: user.id} ).count.positive?
  end

  def join_user(user)
    con = UsersRoom.new(user_id: user.id,
                        room_id: self.id, status: 1)
    con.save!
  end
  def leave_user(user)
    ActiveRecord::Base.transaction do
      con = UsersRoom.where(user_id: user.id,
                            room_id: self.id, status: 1)
      con.delete_all
      me = UsersRoom.where(user_id: user.id, room_id: self.id, status: 0).count
      if self.admins.count > me
        con = UsersRoom.where(user_id: user.id, room_id: self.id, status: 0)
        con.delete_all
        true
      else
        false
      end
    end

  end

  def make_admin user_id
    con = self.users_rooms.where(user_id: user_id).first

    con.status = 0
    con.save!
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
