class MembersController < ApplicationController

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @member = @appointment.members.build(params[:member])
    if @member.save
      redirect_to :back
    else
      redirect_to :back, :notice => 'Error!'
    end
  end

	def destroy
		@appointment = Appointment.find(params[:appointment_id])
		@member = Member.find(params[:id])
		@member.delete

    respond_to do |format|
      format.html { redirect_to @appointment }
      format.json { head :no_content }
    end
	end
		

end
