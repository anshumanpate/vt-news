module ApplicationHelper

    def display_ist_time(time)
        time.in_time_zone('Asia/Kolkata').strftime('%d-%m-%Y %H:%M:%S %p')
      end
end
