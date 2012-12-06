class Appointment < ActiveRecord::Base
  validates_presence_of :name, :description
  attr_accessible :name, :description, :time, :important, :author_id
  belongs_to :user
  has_many :shares
  has_many :comments
end
