class HomeController < ApplicationController

def index
  @latest_appointment = Appointment.last
end

def show
  render 'index'
end

end
