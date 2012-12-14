class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :buddy_id
			t.boolean :pending, :default => true

      t.timestamps
    end
  end
end
