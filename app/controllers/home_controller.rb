class HomeController < ApplicationController

def index
  if Appointment.count != 0
  	@latest_appointment = Appointment.last.name
  else
  	@latest_appointment = "None"
  end
end

def show
  render 'index'
end

end
