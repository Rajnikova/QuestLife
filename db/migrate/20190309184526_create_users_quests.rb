class CreateUsersQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :users_quests do |t|
      t.belongs_to :user, index: true
      t.belongs_to :quest, index: true
      t.integer :status

      t.timestamps
    end
  end
end
