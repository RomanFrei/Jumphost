class Appointment < ActiveRecord::Base
  validates_presence_of :name, :description
  attr_accessible :name, :description, :time
  belongs_to :user
  has_many :shares
end
