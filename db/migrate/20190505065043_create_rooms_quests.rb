class CreateRoomsQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms_quests do |t|
      t.belongs_to :room, index: true
      t.belongs_to :quest, index: true
      t.timestamps
    end
  end
end
