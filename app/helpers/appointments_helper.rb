module AppointmentsHelper
	def format_time(time)
		time.strftime("%d.%m %H:%M")
	end
end
