class FriendsController < ApplicationController

before_filter :require_user

	def create
		@friend = Friend.create(params[:friend])
		@friend.user_id = current_user.id

		if @friend.buddy_id == current_user.id
			redirect_to :back, :notice => "You can't be friends with yourself."
		elsif @friend.save
			redirect_to :back, :notice => "Friendrequest sent."
		else
			redirect_to :back, :notice => "You already added this user as a friend!"
		end
  end
	
	def new
		@users = User.where( "id NOT IN (?)", current_user.id ) 
		@friend = Friend.new
		@friends = current_user.friends.all
	end

	def add
		@friend = Friend.create(:user_id => current_user.id, :buddy_id => params[:id] )

		if @friend.buddy_id == current_user.id
			redirect_to :back, :notice => "You can't be friends with yourself."
		elsif @friend.save
			redirect_to :back, :notice => "Friend added."
		else
			redirect_to :back, :notice => "This user is already your friend!"
		end
	end

	def accept_friendship
		@friend = Friend.find(params[:id])
		@friend.pending = false
		@friend.save
		Friend.create(:pending => false, :user_id => current_user.id, :buddy_id => @friend.user_id)
		redirect_to :back, :notice => 'Friendship accepted.'
	end

	def destroy
		@user = current_user
		@friend = Friend.find(params[:id])
		@friendship = Friend.where(:pending => false, :user_id => @friend.buddy_id, :buddy_id => @friend.user_id)
		@friend.delete
		@friendship.delete

    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end

	end

end
