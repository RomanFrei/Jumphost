class HomeController < ApplicationController

before_filter :get_memberships

def index
  if Appointment.count != 0
  	@latest_appointment = Appointment.last(:conditions => ["id IN (?) OR author_id = ?", @memberships.map{|m| m.appointment_id}, current_user.id]).name

  else
  	@latest_appointment = "None"
  end
end

def show
  render 'index'
end

end
