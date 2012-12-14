class Friend < ActiveRecord::Base
  attr_accessible :buddy_id, :user_id
  belongs_to :user
	validates_uniqueness_of :buddy_id, :scope => :user_id 
end
