class MembersController < ApplicationController

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @member = @appointment.members.build(params[:member])
    if @member.save
      redirect_to :back
    else
      printf "blabla"
    end
  end

end
