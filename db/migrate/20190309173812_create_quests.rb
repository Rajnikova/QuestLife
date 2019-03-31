class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :task
      t.string :description
      t.integer :reward

      t.string

    end
  end
end
