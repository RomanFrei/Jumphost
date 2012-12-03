class Appointment < ActiveRecord::Base
  attr_accessible :name, :description, :time
  belongs_to :user
  has_many :shares
end
