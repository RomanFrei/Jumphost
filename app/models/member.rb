class Member < ActiveRecord::Base
  attr_accessible :appointment_id, :user_id
  belongs_to :appointment, :dependent => :destroy
  belongs_to :user, :dependent => :destroy
  validates_uniqueness_of :appointment_id, :scope => :user_id
end
