class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      	        :fellow_ids

      t.timestamps
    end
  end
end
