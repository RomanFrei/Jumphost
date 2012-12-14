class FriendsController < ApplicationController

	def create
		@friend = Friend.create(params[:friend])
		@friend.user_id = current_user.id
		if @friend.save
			redirect_to :back
		else
			puts "blalubb"
		end
  end
	
	def new
		@users = User.where( "id NOT IN (?)", current_user.id ) 
		@friend = Friend.new
	end

	def add
		@friend = Friend.create(:user_id => current_user.id, :buddy_id => params[:id] )
		if @friend.save
			redirect_to :back, :notice => 'Friend added.'
		else
			redirect_to :back, :notice => 'You already added this user as a friend.'
		end
	end

end
