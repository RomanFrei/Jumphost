class User < ActiveRecord::Base
	acts_as_authentic
	attr_accessible :username, :login, :email, :password, :password_confirmation
	has_many :appointments
	has_many :shares
	has_many :comments
	belongs_to :members
end
