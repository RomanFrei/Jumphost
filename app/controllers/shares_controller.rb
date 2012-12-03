class SharesController < ApplicationController

  def create 
    @share = Shares.new
    @share = Shares.create(params[:share])
    @share.user_id = current_user.id
    @share.appointment_id = 1
    if @share.save
	redirect_to :back
    else
	redirect_to :back
    end
  end

end
