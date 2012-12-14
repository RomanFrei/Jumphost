class FriendsController < ApplicationController

	def create
		@friend = Friend.create(params[:friend])
		@friend.user_id = current_user.id

		if @friend.buddy_id == current_user.id
			redirect_to :back, :notice => "You can't be friends with yourself."
		elsif @friend.save
			redirect_to :back, :notice => "Friend added."
		else
			redirect_to :back, :notice => "Error!"
		end
  end
	
	def new
		@users = User.where( "id NOT IN (?)", current_user.id ) 
		@friend = Friend.new
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

	def destroy
		@user = current_user
		@friend = Friend.find(params[:id])
		@friend.delete

    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end

	end

end
