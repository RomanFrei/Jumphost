class Group < ActiveRecord::Base
  attr_accessible :fellow_ids, :user_id
  belongs_to :user
  serialize :fellow_ids, Array
end
