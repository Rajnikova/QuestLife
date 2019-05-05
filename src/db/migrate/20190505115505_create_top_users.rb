class CreateTopUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :top_users do |t|
      t.belongs_to :user, index: true
      t.integer :level
      t.integer :score
      t.timestamps
    end
  end
end
