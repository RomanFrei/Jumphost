class Shares < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :appointment
  validates_uniqueness_of :user_id, :scope => :appointment_id
end
