class SharesController < ApplicationController

  def create 
    @share = Shares.new
    @share = Shares.create(params[:share])
    @share.user_id = current_user.id
    @share.appointment_id = params[:id]
    if @share.save
	redirect_to :back, :notice => 'participation confirmed.'
    else
	redirect_to :back
    end
  end

  def destroy
    @share = Shares.first(:conditions => [ 'appointment_id = ? AND user_id = ?',  params[:id], current_user.id ] )
    @share.destroy

    redirect_to :back, :notice => 'checked out'
  end

end
