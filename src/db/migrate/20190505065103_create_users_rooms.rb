class CreateUsersRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :users_rooms do |t|
      t.belongs_to :user, index: true
      t.belongs_to :room, indexx: true
      t.integer :status
      t.timestamps
    end
  end
end
