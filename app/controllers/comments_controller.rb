class CommentsController < ApplicationController

def create
	@appointment = Appointment.find(params[:appointment_id])
	@comment = @appointment.comments.build(params[:comment])
	@comment.author_id = current_user.id
	if @comment.save
	redirect_to :back
	else
	printf "blabla"
	end
end
end
